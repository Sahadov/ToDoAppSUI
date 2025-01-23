//
//  NewItemViewModel.swift
//  ToDoApp
//
//  Created by Dmitry Volkov on 23/01/2025.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false

    init() {}
    
    func save() {
        guard canSave else { return }
        
        // Get current user id
        guard let id = Auth.auth().currentUser?.uid else { return }
        
        // Create model
        let newId = UUID().uuidString
        let newItem = ToDoItem(id: newId, title: title, dueDate: dueDate.timeIntervalSince1970, created: Date().timeIntervalSince1970, isDone: false)
        
        // Save model as a subcollection of a user
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
    }
    
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else { return false }
        guard dueDate >= Date().addingTimeInterval(-86400) else { return false }  // 86400 one day
        
        return true
    }
}
