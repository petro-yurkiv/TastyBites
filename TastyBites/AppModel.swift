//
//  AppModel.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 25.05.2024.
//

import Foundation

enum AppModel {
    static var token: String {
        get {
            return UserDefaults.standard.string(forKey: "token") ?? ""
        }
        set(newValue) {
            UserDefaults.standard.set(newValue, forKey: "token")
            UserDefaults.standard.synchronize()
        }
    }
}
