//
//  PeopleListViewModel.swift
//  TasksCoreData
//
//  Created by Joshua Rück on 21.03.24.
//

import Foundation

class PeopleListViewModel: ObservableObject {
    
    @Published var people: [Person] = []
    
    private let repository = Repository.shared
    
    init() {
        fetchPeople()
    }
    
    func fetchPeople() {
        do {
            try people = repository.fetchPeople()
        } catch {
            handleDatabaseError()
        }
    }
    
    func addPerson() {
        do {
            try repository.addPerson()
            fetchPeople()
        } catch {
            handleDatabaseError()
        }
    }
    
    func delPerson(person: Person) {
        do {
            try repository.deletePerson(person: person)
        } catch {
            handleDatabaseError()
        }
    }
    
    private func handleDatabaseError() {
        let errorText = "Fehler beim Datenbankzugriff!"
        print(errorText)
    }
    
}
