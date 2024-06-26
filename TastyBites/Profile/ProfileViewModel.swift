//
//  ProfileViewModel.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 25.05.2024.
//

import Foundation

class ProfileViewModel: ObservableObject {
    weak var coordinator: ProfileCoordinator?
    
    func goToSettings() {
        coordinator?.navigateToSettings()
    }
    
    func goToMyRecipes() {
        coordinator?.navigateToMyRecipes()
    }
    
    func goToLiked() {
        coordinator?.navigateToLiked()
    }
    
    func signOut() {
        AppModel.token = ""
    }
}
