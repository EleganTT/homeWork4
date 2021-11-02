//
//  CompletedTasksTableViewController.swift
//  homeWork4
//
//  Created by Dmitriy Lee on 21.10.2021.
//

import UIKit

protocol CompletedTasksTableViewProtocol {
}

class CompletedTasksTableViewController: UITableViewController, CompletedTasksTableViewProtocol {
    
    var newTasks = Array<CompletedAndDeletedTasks>()
    
    var presenter: CompletedTasksPresenterProtocol!
    
    var configurator: CompletedTasksConfiguratorProtocol = CompletedTasksConfigurator()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        configurator.configure(with: self)
        newTasks = presenter.fetchAllTasks()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newTasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CompletedTasksTableViewCell", for: indexPath) as! CompletedTasksTableViewCell

        cell.initCell(title: newTasks[indexPath.row].name, description: newTasks[indexPath.row].descrpt, date: newTasks[indexPath.row].date, deadline: newTasks[indexPath.row].deadline, status: newTasks[indexPath.row].status)

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTask = newTasks[indexPath.row]
        
        let alertController = UIAlertController(title: "Желаете восстановить задание?", message: "", preferredStyle: .alert)
        
        let alertActionDone = UIAlertAction(title: "Восстановить", style: .default) { (alert) in
            PersistenceActualTasks().addTask(task: selectedTask, status: "not completed")
            PersistenceCompletedAndDeletedTasks().deleteData(item: selectedTask)
            
            self.newTasks = self.presenter.fetchAllTasks()
            
            tableView.reloadData()
        }
        alertActionDone.setValue(UIColor.systemBlue, forKey: "titleTextColor")
        
        let alertActionDelete = UIAlertAction(title: "Удалить", style: .default) { (alert) in
            PersistenceCompletedAndDeletedTasks().deleteData(item: selectedTask)
            
            self.newTasks = self.presenter.fetchAllTasks()
            
            tableView.reloadData()
        }
        alertActionDelete.setValue(UIColor.systemRed, forKey: "titleTextColor")
        
        alertController.addAction(alertActionDone)
        alertController.addAction(alertActionDelete)
        
        present(alertController, animated: true, completion: nil)
        
    }
}
