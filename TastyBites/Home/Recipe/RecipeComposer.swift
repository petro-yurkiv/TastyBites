//
//  RecipeComposer.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 27.05.2024.
//

import SwiftUI

class RecipeComposer: Composer {
    deinit {
        print("composer deinited")
    }
    
    func build(coordinator: ChildCoordinator) -> UIViewController {
        let viewModel = RecipeViewModel()
        viewModel.coordinator = coordinator as? RecipeCoordinator
        let view = RecipeView(viewModel: viewModel)
        let vc = UIHostingController(rootView: view)
        return vc
    }
}
