//
//  Address.swift
//  livecoding
//
//  Created by Hosein Abbaspour on 3/9/24.
//

import Foundation

struct Address: Decodable, Hashable {
    let street: String
    let city: String
    let zipcode: String
    let suite: String
}
