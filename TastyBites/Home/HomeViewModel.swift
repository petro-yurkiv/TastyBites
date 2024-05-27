//
//  HomeViewPresenter.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 24.05.2024.
//

import Foundation

class HomeViewModel: ObservableObject {
    weak var coordinator: HomeCoordinator?
    @Published var text: String?
    var categories: [String] = ["All", "Breakfast", "Lunch", "Al", "Breakfas", "Lunc"]
    var recipes: [String] = ["Test1", "Test2", "Test3", "Test4", "Test5"]
    
    func onTap() {
        text = "Home"
    }
}
