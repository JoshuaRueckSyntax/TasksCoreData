//
//  Repository.swift
//  TasksCoreData
//
//  Created by Joshua Rück on 20.03.24.
//

import Foundation

class Repository {
    
    static let shared = Repository()
    
    private let store = PersistentStore()
    
    private init(){}
    
    func fetchTasks() throws -> [Task]{
        let request = Task.fetchRequest()
        return try store.context.fetch(request)
    }
    
    func addTask(title: String) throws {
        let task = Task(context: store.context)
        task.title = title
        
        try store.save()
    }
    
    func deleteTask(task: Task) throws {
        store.context.delete(task)
        
        try store.save()
    }
    
    func toggleFav(task: Task) throws {
        task.completed.toggle()
        
        try store.save()
    }
    
}
