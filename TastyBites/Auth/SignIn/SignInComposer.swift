//
//  SignInComposer.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 25.05.2024.
//

import SwiftUI

class SignInComposer: Composer {
    func build(coordinator: any Coordinator) -> UIViewController {
        let viewModel = SignInViewModel()
        let view = SignInView(viewModel: viewModel)
        let vc = UIHostingController(rootView: view)
        return vc
    }
}
