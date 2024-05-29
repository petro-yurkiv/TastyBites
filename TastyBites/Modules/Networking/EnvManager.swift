//
//  EnvManager.swift
//  TastyBites
//
//  Created by Maxym Bilyk on 29.05.2024.
//

import Foundation

class EnvManager {
    static let shared = EnvManager()
    
    private init() {
        // We use ! here because we'd want to crash if missing
        if let envDict = Bundle.main.infoDictionary?["LSEnvironment"] as? Dictionary<String, String> {
            let envStr = envDict["RELEASE_ENV"] ?? ""
            envType = EnvType(envStr: envStr)
        } else {
            envType = EnvType(envStr: "")
        }
    }
    
    var envType: EnvType
    
    enum EnvType {
        case dev
        
        init(envStr: String) {
            switch envStr {
            case "Dev":
                self = .dev
            default:
                fatalError("Invalid env")
            }
        }
        
        var backEndUrl: String {
            switch self {
            case .dev:
                return "BACKENDURL"
            }
        }
    }
}
