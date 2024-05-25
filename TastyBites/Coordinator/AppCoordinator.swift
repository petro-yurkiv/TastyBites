//
//  AppCoordinator.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 24.05.2024.
//

import UIKit

class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var tabBarChildCoordinators: [ChildCoordinator] = []
    private var window: UIWindow
    private var tabBarController = UITabBarController()
    
    init(window: UIWindow) {
        self.window = window
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
    
    func initializeChildCoordinators() {
        let homeCoordinator = HomeCoordinator(parentCoordinator: self, navigationController: UINavigationController())
        let addRecipeCoordinator = AddRecipeCoordinator(parentCoordinator: self, navigationController: UINavigationController())
        let profileCoordinator = ProfileCoordinator(parentCoordinator: self, navigationController: UINavigationController())
        
        tabBarChildCoordinators = [homeCoordinator, addRecipeCoordinator, profileCoordinator]

        tabBarChildCoordinators.forEach { coordinator in
            coordinator.start()
            childCoordinators.append(coordinator)
        }
    }
    
    func setViewsToTabBarController() {
        tabBarController.viewControllers = tabBarChildCoordinators.map { $0.navigationController }
        
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
        print("token: \(AppModel.token)")
        if AppModel.token == "" {
            let initialCoordinator = SignInCoordinator(parentCoordinator: self, navigationController: UINavigationController())
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
