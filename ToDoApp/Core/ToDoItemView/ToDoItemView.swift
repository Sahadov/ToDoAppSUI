//
//  ToDoItemView.swift
//  ToDoApp
//
//  Created by Dmitry Volkov on 23/01/2025.
//

import SwiftUI

struct ToDoItemView: View {
    @StateObject var viewModel = ToDoItemViewModel()
    var item: ToDoItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .fontWeight(.semibold)
                    .font(.body)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundStyle(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .imageScale(.medium)
            }
            
        }
    }
}

#Preview {
    ToDoItemView(item: ToDoItem(id: "123", title: "Buy new shoes", dueDate: Date().timeIntervalSince1970, created: Date().timeIntervalSince1970, isDone: false))
}
