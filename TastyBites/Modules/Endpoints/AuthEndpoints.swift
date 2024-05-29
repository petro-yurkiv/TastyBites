//
//  AuthEndpoints.swift
//  TastyBites
//
//  Created by Maxym Bilyk on 29.05.2024.
//

import Foundation
import Alamofire

enum AuthEndpoints {
    case login(parameters: [String: Any])
    case register(parameters: [String: Any])
}

extension AuthEndpoints: IEndpoint {
    var method: Alamofire.HTTPMethod {
        switch self {
        case .login, .register:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .login:
            return "auth/login"
        case .register:
            return "auth/register"
        }
    }
    
    var parameter: Alamofire.Parameters? {
        switch self {
        case .login(let parameters), .register(let parameters):
            return parameters
        }
    }
    
    var header: Alamofire.HTTPHeaders? {
        switch self {
        case .login, .register:
            return nil
        }
    }
    
    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
}
