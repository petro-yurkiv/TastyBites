//
//  HomeViewPresenter.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 24.05.2024.
//

import Foundation

class RecipesViewModel: ObservableObject {
    weak var coordinator: RecipesCoordinator?
    var screenType: RecipesScreenType
    var categories: [String] = ["All", "Breakfast", "Lunch", "Al", "Breakfas", "Lunc"]
    var recipes: [String] = ["Test1", "Test2", "Test3", "Test4", "Test5"]
    
    init(screenType: RecipesScreenType) {
        self.screenType = screenType
    }
    
    deinit {
        coordinator?.didFinish()
    }
    
    func goToRecipe() {
        coordinator?.navigateToRecipe()
    }
}
