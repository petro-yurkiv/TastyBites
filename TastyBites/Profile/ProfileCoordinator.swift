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
    
    func navigateToSettings() {
        let coordinator = SettingsCoordinator(parentCoordinator: self, navigationController: navigationController)
        coordinator.start()
        childCoordinators.append(coordinator)
    }
    
    func navigateToMyRecipes() {
        let coordinator = RecipesCoordinator(parentCoordinator: self, navigationController: navigationController)
        coordinator.startWithType(screenType: .myRecipes)
        childCoordinators.append(coordinator)
    }
    
    func navigateToLiked() {
        let coordinator = RecipesCoordinator(parentCoordinator: self, navigationController: navigationController)
        coordinator.startWithType(screenType: .liked)
        childCoordinators.append(coordinator)
    }
}
