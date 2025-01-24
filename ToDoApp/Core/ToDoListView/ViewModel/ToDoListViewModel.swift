//
//  ToDoListViewModel.swift
//  ToDoApp
//
//  Created by Dmitry Volkov on 23/01/2025.
//
import FirebaseFirestore
import Foundation

class ToDoListViewModel: ObservableObject {
    @Published var showNewItem = false
    private let userId: String
    
   
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
