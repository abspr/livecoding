//
//  APIEndpoint.swift
//  livecoding
//
//  Created by Hosein Abbaspour on 3/9/24.
//

import Alamofire

enum EndpointType {
    case regular(parameters: [String: Any]?, encoding: ParameterEncoding)
}

protocol APIEndpoint {
    var method: HTTPMethod { get }
    var path: String { get }
    var type: EndpointType { get }
}
