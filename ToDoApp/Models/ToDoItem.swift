//
//  ToDoItem.swift
//  ToDoApp
//
//  Created by Dmitry Volkov on 23/01/2025.
//

import Foundation

struct ToDoItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let created: TimeInterval
    var isDone: Bool
    
    mutating func setStatus() {
        isDone.toggle()
    }
}
