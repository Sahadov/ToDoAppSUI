//
//  User.swift
//  ToDoApp
//
//  Created by Dmitry Volkov on 22/01/2025.
//

import Foundation

struct User: Codable {
    let id: String
    let username: String
    let email: String
    let joined: TimeInterval
}
