//
//  SignUpComposer.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 25.05.2024.
//

import SwiftUI

class SignUpComposer: Composer {
    func build(coordinator: any Coordinator) -> UIViewController {
        let viewModel = SignUpViewModel()
        let view = SignUpView(viewModel: viewModel)
        let vc = UIHostingController(rootView: view)
        return vc
    }
}
