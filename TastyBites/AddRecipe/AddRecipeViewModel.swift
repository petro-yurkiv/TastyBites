//
//  AddRecipeViewModel.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 25.05.2024.
//

import Foundation

class AddRecipeViewModel: ObservableObject {
    weak var coordinator: AddRecipeCoordinator?
    @Published var text: String?
    
    func onTap() {
        text = "AddRecipe"
    }
}
