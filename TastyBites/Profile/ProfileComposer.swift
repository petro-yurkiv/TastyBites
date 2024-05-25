//
//  ProfileComposer.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 25.05.2024.
//

import SwiftUI

class ProfileComposer: Composer {
    func build(coordinator: any Coordinator) -> UIViewController {
        let viewModel = ProfileViewModel()
        let view = ProfileView(viewModel: viewModel)
        let vc = UIHostingController(rootView: view)
        return vc
    }
}
