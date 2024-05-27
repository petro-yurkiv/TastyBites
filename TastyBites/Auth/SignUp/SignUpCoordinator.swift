//
//  SignInCoordinator.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 25.05.2024.
//

import UIKit

class SignUpCoordinator: ChildCoordinator {
    var parentCoordinator: Coordinator
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    required init(parentCoordinator: Coordinator, navigationController: UINavigationController) {
        self.parentCoordinator = parentCoordinator
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = SignUpComposer().build(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func navigateToSignIn() {
        navigationController.popViewController(animated: true)
    }
    
    func navigateToHome() {
        let parentCoordinator = parentCoordinator as? SignInCoordinator
        parentCoordinator?.navigateToHome()
    }
}
