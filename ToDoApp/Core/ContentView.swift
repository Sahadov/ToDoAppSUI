//
//  ContentView.swift
//  ToDoApp
//
//  Created by Dmitry Volkov on 21/01/2025.
//

import SwiftUI


struct ContentView: View {
    
    
    var body: some View {
        TLHeader(title: "To Do List", subTitle: "Get things done", color: .pink)
        Spacer()
    }
}

#Preview {
    ContentView()
}
