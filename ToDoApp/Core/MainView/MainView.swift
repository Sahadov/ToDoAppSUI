//
//  MainView.swift
//  ToDoApp
//
//  Created by Dmitry Volkov on 22/01/2025.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            ToDoListView()
        } else {
            LoginView()
        }
        
    }
}

#Preview {
    MainView()
}
