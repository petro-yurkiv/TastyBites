//
//  SignInViewModel.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 25.05.2024.
//

import Foundation

class SignInViewModel: ObservableObject {
    weak var coordinator: SignInCoordinator?
    @Published var text: String?
    
    func signIn() {
        AppModel.token = "test"
        coordinator?.navigateToHome()
    }
    
    func goToSignUp() {
        coordinator?.navigateToSignUp()
    }
}
