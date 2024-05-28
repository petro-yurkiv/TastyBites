//
//  RecipeCoordinator.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 28.05.2024.
//

import UIKit

class CookingCoordinator: ChildCoordinator {
    var parentCoordinator: Coordinator
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    required init(parentCoordinator: Coordinator, navigationController: UINavigationController) {
        self.parentCoordinator = parentCoordinator
        self.navigationController = navigationController
    }
    
    deinit {
        print("coordinator deinited")
    }
    
    func start() {
        let vc = CookingComposer().build(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
}
