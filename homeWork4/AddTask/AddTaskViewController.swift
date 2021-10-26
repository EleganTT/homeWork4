//
//  AddTaskViewController.swift
//  homeWork4
//
//  Created by Dmitriy Lee on 20.10.2021.
//

import UIKit
import Bond
import ReactiveKit

class AddTaskViewController: UIViewController {
    
    let task = Task()

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var deadlineLabel: UILabel!
    @IBOutlet weak var deadlineDatePicker: UIDatePicker!
    

    @IBOutlet weak var saveButton: UIButton!
    @IBAction func saveButtonAction(_ sender: Any) {
        bind()
        PersistenceActualTasks().saveData(task: task)
        
        let alertController = UIAlertController(title: "Задание добавлено", message: "", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Хорошо", style: .default) { (alert) in
            self.titleTextField.text = ""
            self.descriptionTextField.text = ""
        }
        
        alertController.addAction(alertAction)

        present(alertController, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func bind() {
        titleTextField.reactive.text.ignoreNils()
            .bind(to: task.name)
        descriptionTextField.reactive.text.ignoreNils()
            .bind(to: task.descrpt)
    }
}
