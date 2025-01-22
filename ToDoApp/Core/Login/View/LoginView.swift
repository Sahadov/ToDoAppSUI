//
//  ContentView.swift
//  ToDoApp
//
//  Created by Dmitry Volkov on 21/01/2025.
//

import SwiftUI


struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    
    var body: some View {
        NavigationStack {
            TLHeader(title: "To Do List", subTitle: "Get things done", color: .pink)
                .padding(.top, 50)
            Form() {
                TextField("Username", text: $viewModel.username)
                    .textFieldStyle(.plain)
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(.plain)
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                Button {
                    
                } label: {
                    Text("Log in")
                        .frame(width: 330, height: 49)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
            }
            .frame(height: 230)
            
            Spacer()
            
            VStack {
                Text("New around here?")
                NavigationLink("Create an account", destination: RegisterView())
            }
            .padding(.bottom, 50)
        }
    }
}

#Preview {
    LoginView()
}
