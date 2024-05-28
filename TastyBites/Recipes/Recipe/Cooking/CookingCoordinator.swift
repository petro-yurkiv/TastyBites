//
//  RecipeCoordinator.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 28.05.2024.
//

import SwiftUI

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
    
    func goToHome(_ isSuccess: Bool) {
        if let tabBarController = navigationController.tabBarController {
            let vc = isSuccess == true ? UIHostingController(rootView: SuccessView()) : UIHostingController(rootView: FailureView())
            vc.modalPresentationStyle = .fullScreen
            tabBarController.present(vc, animated: true)
            
            navigationController.popToRootViewController(animated: true)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                vc.dismiss(animated: true, completion: nil)
            }
        }
    }
}
