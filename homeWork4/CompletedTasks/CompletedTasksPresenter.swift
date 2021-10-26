//
//  CompletedTasksPresenter.swift
//  homeWork4
//
//  Created by Dmitriy Lee on 25.10.2021.
//

import Foundation

protocol CompletedTasksPresenterInput {
    var output: CompletedTasksPresenterOutput! { get set }
    
    func getTasks() -> Array<CompletedAndDeletedTasks>
}

protocol CompletedTasksPresenterOutput {
    func updateTasks()
}

class CompletedTasksPresenter: CompletedTasksPresenterInput {
    func getTasks() -> Array<CompletedAndDeletedTasks> {
        return interactor.getTasks()
    }
    
    var output: CompletedTasksPresenterOutput!
    var interactor: CompletedTasksInteractorInput!
    var router: CompletedTasksRouterInput!
    
}

extension CompletedTasksPresenter: CompletedTasksRouterOutput, CompletedTasksInteractorOutput {
    
}
