//
//  AppCoordinator.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 24.05.2024.
//

import UIKit

class AppCoordinator: MainCoordinator {
    var childCoordinators: [Coordinator] = []
    private var window: UIWindow
    private var tabBarController = UITabBarController()
    
    init(window: UIWindow) {
        self.window = window
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
    
    func initializeChildCoordinators() {
        let homeCoordinator = HomeCoordinator(navigationController: UINavigationController())
        let addRecipeCoordinator = AddRecipeCoordinator(navigationController: UINavigationController())
        let profileCoordinator = ProfileCoordinator(navigationController: UINavigationController())
        
        childCoordinators = [homeCoordinator, addRecipeCoordinator, profileCoordinator]

        childCoordinators.forEach { coordinator in
            coordinator.start()
        }
    }
    
    func setViewsToTabBarController() {
        tabBarController.viewControllers = childCoordinators.map { $0.navigationController }
        
        tabBarController.tabBar.items?.enumerated().forEach { index, item in
            let tabBarItem = TabBarItem.allCases[index]
            item.image = UIImage(systemName: tabBarItem.icon)
        }
    }
    
    func start() {
        initializeChildCoordinators()
        setViewsToTabBarController()
        notAuthStart()
    }
    
    func notAuthStart() {
        if AppModel.token == "" {
            let initialCoordinator = SignInCoordinator(navigationController: UINavigationController())
            childCoordinators.append(initialCoordinator)
            initialCoordinator.start()
            
            initialCoordinator.navigationController.modalPresentationStyle = .overFullScreen
            DispatchQueue.main.async {
                if let selectedViewController = self.tabBarController.selectedViewController {
                    selectedViewController.present(initialCoordinator.navigationController, animated: false) {
                        self.tabBarController.selectedIndex = 0
                    }
                }
            }
        }
    }
}
