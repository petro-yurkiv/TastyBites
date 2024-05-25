//
//  ProfileViewModel.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 25.05.2024.
//

import Foundation

class ProfileViewModel: ObservableObject {
    weak var coordinator: ProfileCoordinator?
    @Published var text: String?
    
    func onTap() {
        text = "Profile"
        AppModel.token = ""
    }
}
