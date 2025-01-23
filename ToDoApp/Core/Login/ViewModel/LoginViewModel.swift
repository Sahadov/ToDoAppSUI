//
//  LoginViewModel.swift
//  ToDoApp
//
//  Created by Dmitry Volkov on 22/01/2025.
//

import FirebaseAuth
import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){ }
    
    // Try to login
    func login() {
        guard validate() else { return }
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    // Validate the form
    private func validate() -> Bool {
        errorMessage = ""
        // Checking both textfields are not empty
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
        !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please, fill in all fields"
            return false
        }
        // Validating email format
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please, enter a valid email"
            return false
        }
        
        return true
    }
}
