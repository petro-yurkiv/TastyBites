//
//  CookingViewModel.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 28.05.2024.
//

import Foundation

class CookingViewModel: ObservableObject {
    weak var coordinator: CookingCoordinator?
    var steps: [String] = ["1", "2", "3", "4", "5"]
    
    deinit {
        coordinator?.didFinish()
    }
    
    func finish() {
        coordinator?.goToHome(true)
    }
}
