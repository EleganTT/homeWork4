//
//  CompletedTasksPresenter.swift
//  homeWork4
//
//  Created by Dmitriy Lee on 25.10.2021.
//

import Foundation

protocol CompletedTasksPresenterInput {
    func getTasks()
}

protocol CompletedTasksPresenterOutput {
    func updateTasks(tasks: Array<CompletedAndDeletedTasks>)
}

class CompletedTasksPresenter: CompletedTasksInteractorOutput, CompletedTasksPresenterInput {
    func getTasks() {
        interactor.provideTasks()
        
    }

    func receiveTasks(tasks: Array<CompletedAndDeletedTasks>) {
        let newTasks = tasks
        output.updateTasks(tasks: newTasks)
    }
    
    var output: CompletedTasksPresenterOutput!
    var interactor: CompletedTasksInteractorInput!
    var router: CompletedTasksRouterInput!
    
}
