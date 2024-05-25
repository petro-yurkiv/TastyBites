//
//  TabBarItem.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 25.05.2024.
//

import Foundation

enum TabBarItem: CaseIterable {
    case home
    case addRecipe
    case profile
    
    var icon: String {
        switch self {
        case .home:
            return "house"
        case .addRecipe:
            return "plus.circle"
        case .profile:
            return "person"
        }
    }
}
