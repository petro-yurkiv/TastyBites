//
//  Coordinator.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 24.05.2024.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    var childCoordinators: [Coordinator] { get set }
    func start()
}
