//
//  UserEndpoint.swift
//  quandoo
//
//  Created by Hosein Abbaspour on 3/9/24.
//

import Foundation
import Alamofire

enum UserEndpoint: APIEndpoint {
    case users
   
    var method: Alamofire.HTTPMethod {
        switch self {
        case .users: return .get
        }
    }
    
    var path: String {
        switch self {
        case .users: return "users"
        }
    }
    
    var type: EndpointType {
        switch self {
        case .users:
            return .regular(parameters: nil, encoding: URLEncoding.default)
        }
    }
       
}
