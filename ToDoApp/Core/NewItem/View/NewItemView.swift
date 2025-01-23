//
//  NewItemView.swift
//  ToDoApp
//
//  Created by Dmitry Volkov on 23/01/2025.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.largeTitle).bold()
                .padding()
            
            Form {
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                DatePicker("Due date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                Button {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented.toggle()
                    } else {
                        viewModel.showAlert.toggle()
                    }
                } label: {
                    Text("Add")
                        .frame(width: 330, height: 49)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .padding()
            }
            
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text("Ooopsss..."), message: Text("Fill in all forms to save the task"))
        }
    }
}

#Preview {
    NewItemView(newItemPresented: .constant(true))
}
