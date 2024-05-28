//
//  SettingsCoordinator.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 28.05.2024.
//

import UIKit

class SettingsCoordinator: ChildCoordinator {
    var parentCoordinator: Coordinator
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    required init(parentCoordinator: Coordinator, navigationController: UINavigationController) {
        self.parentCoordinator = parentCoordinator
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = SettingsComposer().build(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
}
