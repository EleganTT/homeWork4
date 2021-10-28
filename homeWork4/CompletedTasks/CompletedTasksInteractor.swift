//
//  CompletedTasksInteractor.swift
//  homeWork4
//
//  Created by Dmitriy Lee on 25.10.2021.
//

import Foundation


protocol CompletedTasksInteractorInput {
    func provideTasks()
}

protocol CompletedTasksInteractorOutput {
    func receiveTasks(tasks: Array<CompletedAndDeletedTasks>)
}

class CompletedTasksInteractor: CompletedTasksInteractorInput {
    var output: CompletedTasksInteractorOutput!
    
    func provideTasks(){
        let tasks = PersistenceCompletedAndDeletedTasks().loadData()
        let array = Array(tasks)
        output.receiveTasks(tasks: array)
        print(array)
    }
}
