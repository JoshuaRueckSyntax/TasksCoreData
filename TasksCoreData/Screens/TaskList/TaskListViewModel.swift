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
    
    func toggleFav(task: Task) {
        do {
            try repository.toggleFav(task: task)
            fetchTasks()
        } catch {
            handleDatabaseError()
        }
    }
    
    private func handleDatabaseError() {
        var errorText = "Fehler beim Datenbankzugriff!"
        print(errortext)
    }
    
}
