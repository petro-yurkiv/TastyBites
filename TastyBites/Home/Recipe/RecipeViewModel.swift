//
//  RecipeViewModel.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 27.05.2024.
//

import Foundation

class RecipeViewModel: ObservableObject {
    weak var coordinator: RecipeCoordinator?
    @Published var text: String?
    
    deinit {
        coordinator?.didFinish()
    }
    
    func onTap() {
        text = "Recipe"
    }
}
