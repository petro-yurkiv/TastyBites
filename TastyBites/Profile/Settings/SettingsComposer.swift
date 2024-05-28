//
//  SettingsComposer.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 28.05.2024.
//

import SwiftUI

class SettingsComposer: Composer {
    func build(coordinator: ChildCoordinator) -> UIViewController {
        let viewModel = SettingsViewModel()
        viewModel.coordinator = coordinator as? SettingsCoordinator
        let view = SettingsView(viewModel: viewModel)
        let vc = UIHostingController(rootView: view)
        return vc
    }
}
