//
//  Composer.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 24.05.2024.
//

import UIKit

protocol Composer {
    func build(coordinator: ChildCoordinator) -> UIViewController
}
