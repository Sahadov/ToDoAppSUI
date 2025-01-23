//
//  MainViewModel.swift
//  ToDoApp
//
//  Created by Dmitry Volkov on 22/01/2025.
//
import FirebaseAuth
import Foundation

class MainViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    // Update currentUserId any time logged in or logged out
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
