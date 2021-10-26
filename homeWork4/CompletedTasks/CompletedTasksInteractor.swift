//
//  CompletedTasksInteractor.swift
//  homeWork4
//
//  Created by Dmitriy Lee on 25.10.2021.
//

import Foundation


protocol CompletedTasksInteractorInput {
    func getTasks() -> Array<CompletedAndDeletedTasks>
}

protocol CompletedTasksInteractorOutput {
    
}

class CompletedTasksInteractor: CompletedTasksInteractorInput {
    func getTasks() -> Array<CompletedAndDeletedTasks> {
        let tasks = PersistenceCompletedAndDeletedTasks().loadData()
        let array = Array(tasks)
        return array
    }
}
