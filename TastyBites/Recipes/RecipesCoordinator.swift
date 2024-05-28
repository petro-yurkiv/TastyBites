//
//  HomeCoordinator.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 24.05.2024.
//

import UIKit

class RecipesCoordinator: ChildCoordinator {
    var parentCoordinator: Coordinator
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    required init(parentCoordinator: Coordinator, navigationController: UINavigationController) {
        self.parentCoordinator = parentCoordinator
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = RecipesComposer(screenType: .home).build(coordinator: self)
        navigationController.setViewControllers([vc], animated: true)
    }
    
    func startWithType(screenType: RecipesScreenType) {
        let vc = RecipesComposer(screenType: screenType).build(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func navigateToRecipe() {
        let coordinator = RecipeCoordinator(parentCoordinator: self, navigationController: navigationController)
        coordinator.start()
        childCoordinators.append(coordinator)
    }
}
