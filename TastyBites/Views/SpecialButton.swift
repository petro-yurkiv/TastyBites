//
//  SpecialButton.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 27.05.2024.
//

import SwiftUI

struct SpecialButton: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Spacer()
                Text(title)
                    .font(.system(size: 16.0, weight: .bold))
                    .foregroundStyle(Color(.white))
                    .padding(.vertical, 12.0)
                Spacer()
            }
            .background(Color(AppColor.accent.rawValue))
            .cornerRadius(8.0)
        }
    }
}

#Preview {
    SpecialButton(title: "Hello") {
        
    }
}
