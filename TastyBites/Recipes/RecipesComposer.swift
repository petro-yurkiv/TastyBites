//
//  HomeComposer.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 24.05.2024.
//

import SwiftUI

class RecipesComposer: Composer {
    var screenType: RecipesScreenType
    
    init(screenType: RecipesScreenType) {
        self.screenType = screenType
    }
    
    func build(coordinator: ChildCoordinator) -> UIViewController {
        let viewModel = RecipesViewModel(screenType: screenType)
        viewModel.coordinator = coordinator as? RecipesCoordinator
        let view = RecipesView(viewModel: viewModel)
        let vc = UIHostingController(rootView: view)
        return vc
    }
}
