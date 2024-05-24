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
    
    func start() {
        print("start")
    }
}
