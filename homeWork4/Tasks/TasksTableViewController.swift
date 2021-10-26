//
//  TasksTableViewController.swift
//  homeWork4
//
//  Created by Dmitriy Lee on 20.10.2021.
//

import UIKit

class TasksTableViewController: UITableViewController {

    
    var tasks = PersistenceActualTasks().loadData()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.rightBarButtonItem = navigationController?.addTaskButton()
        navigationItem.leftBarButtonItem = navigationController?.addCompletedTasksButton()
        
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath) as! TaskTableViewCell
        
        cell.initCell(title: tasks[indexPath.row].name, description: tasks[indexPath.row].descrpt, date: tasks[indexPath.row].date, deadline: tasks[indexPath.row].deadline, status: tasks[indexPath.row].status)
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTask = tasks[indexPath.row]
        
        let alertController = UIAlertController(title: "Вы выполнили задание?", message: "", preferredStyle: .alert)
        
        let alertActionDone = UIAlertAction(title: "Выполнено", style: .default) { (alert) in
            PersistenceCompletedAndDeletedTasks().addTask(task: selectedTask, status: "completed")
            PersistenceActualTasks().deleteData(item: selectedTask)
            
            tableView.reloadData()
        }
        alertActionDone.setValue(UIColor.systemGreen, forKey: "titleTextColor")
        
        let alertActionDelete = UIAlertAction(title: "Удалить", style: .default) { (alert) in
            PersistenceCompletedAndDeletedTasks().addTask(task: selectedTask, status: "deleted")
            PersistenceActualTasks().deleteData(item: selectedTask)
            
            tableView.reloadData()
        }
        alertActionDelete.setValue(UIColor.systemRed, forKey: "titleTextColor")
        
        alertController.addAction(alertActionDone)
        alertController.addAction(alertActionDelete)

        
        present(alertController, animated: true, completion: nil)
        
    }
}

extension UINavigationController {
    func addTaskButton() -> UIBarButtonItem {
        let rightBarButton = UIButton(type: .system)
        rightBarButton.setTitle("Add task", for: .normal)

        
        rightBarButton.addTarget(self, action: #selector(goToAddTask(sender:)), for: .touchUpInside)
        return UIBarButtonItem(customView: rightBarButton)
    }
    
    @objc func goToAddTask(sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddTaskViewController") as! AddTaskViewController
        self.pushViewController(vc, animated: true)
    }
    
    func addCompletedTasksButton() -> UIBarButtonItem {
        let rightBarButton = UIButton(type: .system)
        rightBarButton.setTitle("Completed tasks", for: .normal)

        
        rightBarButton.addTarget(self, action: #selector(goToCompletedTasks(sender:)), for: .touchUpInside)
        return UIBarButtonItem(customView: rightBarButton)
    }
    
    @objc func goToCompletedTasks(sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "CompletedTasksTableViewController") as! CompletedTasksTableViewController
        self.pushViewController(vc, animated: true)
    }
}
