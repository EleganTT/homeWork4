//
//  CompletedTasksPresenter.swift
//  homeWork4
//
//  Created by Dmitriy Lee on 25.10.2021.
//

import Foundation

protocol CompletedTasksPresenterProtocol {
    func fetchAllTasks() -> Array<CompletedAndDeletedTasks>
}

class CompletedTasksPresenter: CompletedTasksPresenterProtocol {
    
    var view: CompletedTasksTableViewProtocol!
    var interactor: CompletedTasksInteractorProtocol!
    
    func fetchAllTasks() -> Array<CompletedAndDeletedTasks> {
        return interactor.getAllTasks()
    }
    
    required init(view: CompletedTasksTableViewProtocol) {
        self.view = view
    }


}
