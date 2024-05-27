//
//  ProfileCoordinator.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 25.05.2024.
//

import UIKit

class ProfileCoordinator: ChildCoordinator {
    var parentCoordinator: Coordinator
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    required init(parentCoordinator: Coordinator, navigationController: UINavigationController) {
        self.parentCoordinator = parentCoordinator
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ProfileComposer().build(coordinator: self)
        navigationController.setViewControllers([vc], animated: true)
    }
}
