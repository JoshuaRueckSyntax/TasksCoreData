//
//  TaskListViewModel.swift
//  TasksCoreData
//
//  Created by Joshua Rück on 20.03.24.
//

import Foundation

class TaskListViewModel: ObservableObject {
    
    @Published var tasks: [Task] = []
    @Published var taskName: String = ""
    
    private let repository = Repository.shared
    
    init() {
        fetchTasks()
    }
    
    func fetchTasks() {
        do {
            try tasks = repository.fetchTasks()
        } catch {
            handleDatabaseError()
        }
    }
    
    func addTask() {
        do {
            try repository.addTask(title: taskName)
            fetchTasks()
        } catch {
            handleDatabaseError()
        }
    }
    
    func delTask(task: Task) {
        do {
            try repository.deleteTask(task: task)
            fetchTasks()
        } catch {
            handleDatabaseError()
        }
    }
    
    func toggleTask(task: Task) {
        do {
            try repository.toggleTask(task: task)
            fetchTasks()
        } catch {
            handleDatabaseError()
        }
    }
    
    private func handleDatabaseError() {
        let errorText = "Fehler beim Datenbankzugriff!"
        print(errorText)
    }
    
}
