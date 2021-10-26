//
//  AddTaskViewModel.swift
//  homeWork4
//
//  Created by Dmitriy Lee on 20.10.2021.
//

import Foundation
import RealmSwift
import Bond
import ReactiveKit

class ActualTasks: Object {
    @objc dynamic var name = String()
    @objc dynamic var descrpt = String()
    @objc dynamic var date = Date()
    @objc dynamic var deadline = Date()
    @objc dynamic var status = String()
}

class CompletedAndDeletedTasks: Object {
    @objc dynamic var name = String()
    @objc dynamic var descrpt = String()
    @objc dynamic var date = Date()
    @objc dynamic var deadline = Date()
    @objc dynamic var status = String()
}

class Task {
    let name = Property(String())
    let descrpt = Property(String())
    let date = Property(Date())
    let deadline = Property(Date())
    

}

class PersistenceActualTasks {
    static let shared = PersistenceActualTasks()
    private let realm = try! Realm()
    
    func saveData(task: Task) {
        let realmItem = ActualTasks()
        realmItem.name = task.name.value
        realmItem.descrpt = task.descrpt.value
        realmItem.date = task.date.value
        realmItem.deadline = task.deadline.value
        realmItem.status = "not completed"
        
        try! realm.write({
            realm.add(realmItem)
        })
    }
    
    func addTask(task: CompletedAndDeletedTasks, status: String) {
        let realmItem = ActualTasks()
        realmItem.name = task.name
        realmItem.descrpt = task.descrpt
        realmItem.date = task.date
        realmItem.deadline = task.deadline
        realmItem.status = status
        
        try! realm.write({
            realm.add(realmItem)
        })
    }
    
    func loadData() -> Results<ActualTasks> {
        let allItems = realm.objects(ActualTasks.self)
        return allItems
    }
    
    func deleteData(item: ActualTasks) {
        try! realm.write {
            realm.delete(item)
            }
        }
    
    func editData(item: ActualTasks, status: String) {
        try! realm.write {
            item.status = status
        }
    }
    
    func deleteAll() {
        try! realm.write({
            realm.deleteAll()
        })
    }
}

class PersistenceCompletedAndDeletedTasks {
    static let shared = PersistenceCompletedAndDeletedTasks()
    private let realm = try! Realm()
    
    func addTask(task: ActualTasks, status: String) {
        let realmItem = CompletedAndDeletedTasks()
        realmItem.name = task.name
        realmItem.descrpt = task.descrpt
        realmItem.date = task.date
        realmItem.deadline = task.deadline
        realmItem.status = status
        
        try! realm.write({
            realm.add(realmItem)
        })
    }
    
    func loadData() -> Results<CompletedAndDeletedTasks> {
        let allItems = realm.objects(CompletedAndDeletedTasks.self)
        return allItems
    }
    
    func deleteData(item: CompletedAndDeletedTasks) {
        try! realm.write {
            realm.delete(item)
            }
        }
    
    func editData(item: CompletedAndDeletedTasks, status: String) {
        try! realm.write {
            item.status = status
        }
    }
    
    func deleteAll() {
        try! realm.write({
            realm.deleteAll()
        })
    }
}
