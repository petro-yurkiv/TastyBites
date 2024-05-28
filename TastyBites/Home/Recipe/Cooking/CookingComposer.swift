//
//  CookingComposer.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 28.05.2024.
//

import SwiftUI

class CookingComposer: Composer {
    deinit {
        print("composer deinited")
    }
    
    func build(coordinator: ChildCoordinator) -> UIViewController {
        let viewModel = CookingViewModel()
        viewModel.coordinator = coordinator as? CookingCoordinator
        let view = CookingView(viewModel: viewModel)
        let vc = UIHostingController(rootView: view)
        return vc
    }
}
