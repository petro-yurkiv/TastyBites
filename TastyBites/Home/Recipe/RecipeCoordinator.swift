//
//  RecipeCoordinator.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 27.05.2024.
//

import UIKit

class RecipeCoordinator: ChildCoordinator {
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
        let vc = RecipeComposer().build(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
}
