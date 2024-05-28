//
//  SettingsViewModel.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 28.05.2024.
//

import Foundation

class SettingsViewModel: ObservableObject {
    deinit {
        coordinator?.didFinish()
    }
    
    weak var coordinator: SettingsCoordinator?
}
