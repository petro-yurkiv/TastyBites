//
//  SignUpViewModel.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 25.05.2024.
//

import Foundation

class SignUpViewModel: ObservableObject {
    weak var coordinator: SignUpCoordinator?
    @Published var text: String?
    
    func signUp() {
        AppModel.token = "test"
        coordinator?.navigateToHome()
    }
    
    func goToSignIn() {
        coordinator?.navigateToSignIn()
    }
}
