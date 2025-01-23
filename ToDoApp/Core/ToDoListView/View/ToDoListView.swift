//
//  ToDoListView.swift
//  ToDoApp
//
//  Created by Dmitry Volkov on 22/01/2025.
//
import FirebaseFirestore
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewModel()
    @FirestoreQuery var items: [ToDoItem]
    
    init(userId: String) {
        // users/<id>/todos/<entries>
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List(items){ item in
                    ToDoItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                        }
                }
                .listStyle(PlainListStyle())
                
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
    ToDoListView(userId: "SxIGiGD5WFXt9HpKYQJbriq9Ykc2")
}
