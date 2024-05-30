//
//  SignTextField.swift
//  TastyBites
//
//  Created by Maxym Bilyk on 30.05.2024.
//

import SwiftUI

struct SignTextField: View {
    @State var text = ""
    var placeholder = String()
    
    var body: some View {
        VStack {
            HStack {
                TextField("", text: $text, prompt: Text(placeholder)
                    .foregroundColor(Color(AppColor.secondary.rawValue)))
                .font(.system(size: 16.0, weight: .regular))
                .foregroundStyle(Color(AppColor.secondary.rawValue))
                
                Spacer()
                
                Button(action: { print("Hello") }, label: {
                    Image(systemName: "info.circle")
                })
                .foregroundStyle(Color(AppColor.secondary.rawValue))
            }
            .padding()
        }
        .overlay(
            RoundedRectangle(cornerRadius: 8.0)
                .stroke(lineWidth: 1.0)
                .foregroundStyle((Color(AppColor.secondary.rawValue)))
        )
    }
}

#Preview {
    SignTextField()
}
