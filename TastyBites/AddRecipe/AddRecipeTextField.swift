//
//  AddRecipeTextField.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 28.05.2024.
//

import SwiftUI

struct AddRecipeTextField: View {
    @State var text: String = ""
    
    var body: some View {
        VStack {
            TextField("", text: $text, prompt: Text("Name of recipe").foregroundColor(Color(AppColor.secondary.rawValue)))
                .font(.system(size: 32.0, weight: .regular))
                .foregroundStyle(Color(AppColor.secondary.rawValue))
            Divider()
                .frame(height: 1.0)
                .background(Color(AppColor.secondary.rawValue))
        }
    }
}

#Preview {
    AddRecipeTextField()
}
