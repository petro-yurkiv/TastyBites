//
//  MainCoordinator.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 24.05.2024.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    func start()
}

extension Coordinator {
    func childDidFinish(_ child: ChildCoordinator) {
        if let index = childCoordinators.firstIndex(where: { $0 === child }) {
            childCoordinators.remove(at: index)
        }
    }
}
