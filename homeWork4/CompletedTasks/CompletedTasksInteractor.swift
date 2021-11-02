//
//  CompletedTasksInteractor.swift
//  homeWork4
//
//  Created by Dmitriy Lee on 25.10.2021.
//

import Foundation


protocol CompletedTasksInteractorProtocol {
    func getAllTasks() -> Array<CompletedAndDeletedTasks>
}

class CompletedTasksInteractor: CompletedTasksInteractorProtocol {
    func getAllTasks() -> Array<CompletedAndDeletedTasks> {
        let tasks = PersistenceCompletedAndDeletedTasks().loadData()
        let array = Array(tasks)
        return array
    }
    
    var presenter: CompletedTasksPresenterProtocol!
    
    required init(presenter: CompletedTasksPresenterProtocol) {
        self.presenter = presenter
    }
}
