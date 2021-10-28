//
//  CompletedTasksTableViewController.swift
//  homeWork4
//
//  Created by Dmitriy Lee on 21.10.2021.
//

import UIKit

class CompletedTasksTableViewController: UITableViewController, CompletedTasksPresenterOutput {
    func updateTasks(tasks: Array<CompletedAndDeletedTasks>) {
        newTasks = tasks
    }
    
    var presenter: CompletedTasksPresenterInput!
    
    var newTasks = Array<CompletedAndDeletedTasks>()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        presenter.getTasks()
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
            
            tableView.reloadData()
        }
        alertActionDone.setValue(UIColor.systemBlue, forKey: "titleTextColor")
        
        let alertActionDelete = UIAlertAction(title: "Удалить", style: .default) { (alert) in
            PersistenceCompletedAndDeletedTasks().deleteData(item: selectedTask)
            
            tableView.reloadData()
        }
        alertActionDelete.setValue(UIColor.systemRed, forKey: "titleTextColor")
        
        alertController.addAction(alertActionDone)
        alertController.addAction(alertActionDelete)


        
        present(alertController, animated: true, completion: nil)
        
    }
}
