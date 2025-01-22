//
//  TLHeader.swift
//  ToDoApp
//
//  Created by Dmitry Volkov on 22/01/2025.
//

import SwiftUI

enum BackgroundStyle {
    case pink
    case orange
}

struct TLHeader: View {
    var title: String
    var subTitle: String
    var color: BackgroundStyle
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: UIScreen.main.bounds.width * 3, height: 300)
                .foregroundStyle(color == .pink ? .pink : .orange)
                .rotationEffect(Angle(degrees: 15))
            VStack {
                Text(title)
                    .font(.largeTitle.bold())
                Text(subTitle)
                    .font(.title2)
            }
            .padding(.top, 30)
            .foregroundStyle(.white)
        }
        .offset(y: -100)
        
    }
}

#Preview {
    TLHeader(title: "To Do List", subTitle: "Get things done", color: .pink)
}
