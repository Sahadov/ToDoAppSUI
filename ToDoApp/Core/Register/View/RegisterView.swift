//
//  RegisterView.swift
//  ToDoApp
//
//  Created by Dmitry Volkov on 22/01/2025.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()
    
    var body: some View {
        TLHeader(title: "Register", subTitle: "Join up ", color: .orange)
            .padding(.top, 30)
        Form() {
            TextField("Username", text: $viewModel.username)
                .textFieldStyle(.plain)
                .autocorrectionDisabled()
                .autocapitalization(.none)
            TextField("Email", text: $viewModel.username)
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
        .frame(height: 300)
        
        Spacer()
    }
}

#Preview {
    RegisterView()
}
