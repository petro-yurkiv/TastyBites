//
//  SignInCoordinator.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 25.05.2024.
//

import UIKit

class SignInCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = SignInComposer().build(coordinator: self)
        navigationController.setViewControllers([vc], animated: true)
    }
}
