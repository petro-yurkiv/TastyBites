//
//  AddRecipeView.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 25.05.2024.
//

import SwiftUI

struct AddRecipeView: View {
    @ObservedObject var viewModel: AddRecipeViewModel
    @State private var text = String()
    
    var body: some View {
        VStack {
            Text(viewModel.text ?? "")
                .padding()
                .foregroundColor(.red)
            
            Button("Tap") {
                viewModel.onTap()
            }
        }
    }
}

#Preview {
    AddRecipeView(viewModel: AddRecipeViewModel())
}
