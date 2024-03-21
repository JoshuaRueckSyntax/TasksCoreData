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
    
    // Tasks
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
    
    func toggleTask(task: Task) throws {
        task.completed.toggle()
        
        try store.save()
    }
    
    // People
    func fetchPeople() throws -> [Person] {
        let request = Person.fetchRequest()
        return try store.context.fetch(request)
    }
    
    func addPerson() throws {
        let newPerson = Person(context: store.context)
        newPerson.name = SampleData().randomName
        newPerson.picture = SampleData().randomPic
        
        try store.save()
    }
    
    func deletePerson(person: Person) throws {
        store.context.delete(person)
        
        try store.save()
    }
    
}
