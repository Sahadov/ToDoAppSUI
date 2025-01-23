//
//  RegisterViewModel.swift
//  ToDoApp
//
//  Created by Dmitry Volkov on 22/01/2025.
//
import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewModel: ObservableObject {
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){
    
    }
    
    // Try to register a new user
    func signin() {
        guard validate() else { return }
        Auth.auth().createUser(withEmail: email, password: password, completion: { [weak self] result, error in
            guard let userId = result?.user.uid else { return }
            
            self?.insertUserRecord(id: userId)
        })
    }
    
    func insertUserRecord(id: String) {
        let newUser = User(id: id, username: username, email: email, joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    // Validate the form
    private func validate() -> Bool {
        errorMessage = ""
        // Checking both textfields are not empty
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              !username.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please, fill in all fields"
            return false
        }
        // Validating email format
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please, enter a valid email"
            return false
        }
        
        // Validating password lemgth
        guard password.count > 7 else {
            errorMessage = "Password must be at least 8 characters"
            return false
        }
        
        return true
    }
}
