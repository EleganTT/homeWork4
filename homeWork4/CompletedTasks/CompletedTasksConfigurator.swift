//
//  CompletedTasksConfigurator.swift
//  homeWork4
//
//  Created by Dmitriy Lee on 02.11.2021.
//

import Foundation

protocol CompletedTasksConfiguratorProtocol {
    func configure(with viewController: CompletedTasksTableViewController)
}

class CompletedTasksConfigurator: CompletedTasksConfiguratorProtocol {
    
    func configure(with viewController: CompletedTasksTableViewController) {
        let presenter = CompletedTasksPresenter(view: viewController)
        let interactor = CompletedTasksInteractor(presenter: presenter)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
    }
}
