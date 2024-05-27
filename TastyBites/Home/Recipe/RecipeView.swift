//
//  RecipeView.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 27.05.2024.
//

import SwiftUI

struct RecipeView: View {
    @ObservedObject var viewModel: RecipeViewModel
    
    var body: some View {
        Text("Recipe")
    }
}

#Preview {
    RecipeView(viewModel: RecipeViewModel())
}
