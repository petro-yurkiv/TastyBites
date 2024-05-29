//
//  AddRecipeViewModel.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 25.05.2024.
//

import Foundation

class AddRecipeViewModel: ObservableObject {
    weak var coordinator: AddRecipeCoordinator?
    var categories: [String] = ["All", "Breakfast", "Lunch", "Al", "Breakfas", "Lunc"]
    var ingredients: [String] = ["1", "2", "3", "4", "5"]
}
