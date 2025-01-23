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
            accountView
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            Tab("Home", systemImage: "house", content: { ToDoListView(userId: viewModel.currentUserId) })
            Tab("Profile", systemImage: "person.circle", content: { ProfileView() })
        }
    }
}

#Preview {
    MainView()
}
