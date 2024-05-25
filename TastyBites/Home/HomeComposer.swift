//
//  HomeComposer.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 24.05.2024.
//

import SwiftUI

class HomeComposer: Composer {
    func build(coordinator: any ChildCoordinator) -> UIViewController {
        let viewModel = HomeViewModel()
        viewModel.coordinator = coordinator as? HomeCoordinator
        let view = HomeView(viewModel: viewModel)
        let vc = UIHostingController(rootView: view)
        return vc
    }
}
