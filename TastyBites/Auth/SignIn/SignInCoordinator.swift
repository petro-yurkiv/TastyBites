//
//  SignInCoordinator.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 25.05.2024.
//

import UIKit

class SignInCoordinator: ChildCoordinator {
    var parentCoordinator: Coordinator
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    required init(parentCoordinator: any Coordinator, navigationController: UINavigationController) {
        self.parentCoordinator = parentCoordinator
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = SignInComposer().build(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func navigateToSignUp() {
        let coordinator = SignUpCoordinator(parentCoordinator: self, navigationController: navigationController)
        coordinator.start()
        childCoordinators.append(coordinator)
    }
    
    func navigateToHome() {
        navigationController.dismiss(animated: true)
        self.didFinish()
    }
}
