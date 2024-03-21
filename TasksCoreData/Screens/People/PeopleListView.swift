//
//  PeopleListView.swift
//  TasksCoreData
//
//  Created by Joshua Rück on 21.03.24.
//

import SwiftUI

struct PeopleListView: View {
    
    @StateObject var viewModel = PeopleListViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.people, id: \.self) { person in
                HStack {
                    Text(person.name ?? "")
                    Spacer()
                    Image(person.picture ?? "")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                .swipeActions {
                    Button(role: .destructive) {
                        viewModel.delPerson(person: person)
                    } label: {
                        Label("Trash", systemImage: "trash")
                    }
                }
            }
            .navigationTitle("People")
            .toolbar {
                Button {
                    viewModel.addPerson()
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .onAppear{
            viewModel.fetchPeople()
        }
    }
}

#Preview {
    PeopleListView()
}
