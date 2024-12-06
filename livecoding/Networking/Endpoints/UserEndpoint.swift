//
//  UserEndpoint.swift
//  livecoding
//
//  Created by Hosein Abbaspour on 3/9/24.
//

import Foundation
import Alamofire

enum UserEndpoint: APIEndpoint {
    case users
    case posts(userId: Int)
   
    var method: Alamofire.HTTPMethod {
        switch self {
        case .users, .posts: return .get
        }
    }
    
    var path: String {
        switch self {
        case .users: return "users"
        case .posts: return "posts"
        }
    }
    
    var type: EndpointType {
        switch self {
        case .users:
            return .regular(parameters: nil, encoding: URLEncoding.default)
            
        case .posts(let userId):
            return .regular(
                parameters: ["userId": userId], encoding: URLEncoding.default
            )
        }
    }
       
}
