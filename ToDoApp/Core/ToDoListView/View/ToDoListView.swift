//
//  ToDoListView.swift
//  ToDoApp
//
//  Created by Dmitry Volkov on 22/01/2025.
//

import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewModel()
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.showNewItem.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showNewItem) {
                NewItemView(newItemPresented: $viewModel.showNewItem)
            }
        }
        
    }
}

#Preview {
    ToDoListView(userId: "")
}
