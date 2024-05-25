//
//  AddRecipeComposer.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 25.05.2024.
//

import SwiftUI

class AddRecipeComposer: Composer {
    func build(coordinator: any Coordinator) -> UIViewController {
        let viewModel = AddRecipeViewModel()
        let view = AddRecipeView(viewModel: viewModel)
        let vc = UIHostingController(rootView: view)
        return vc
    }
}
