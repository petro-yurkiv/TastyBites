//
//  RecipeViewModel.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 27.05.2024.
//

import Foundation

class RecipeViewModel: ObservableObject {
    weak var coordinator: RecipeCoordinator?
    var ingredients: [String] = ["1", "2", "3", "4", "5"]
    
    deinit {
        coordinator?.didFinish()
    }
    
    func goToCooking() {
        coordinator?.navigateToCooking()
    }
}
