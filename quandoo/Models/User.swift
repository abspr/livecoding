//
//  User.swift
//  quandoo
//
//  Created by Hosein Abbaspour on 3/9/24.
//

import Foundation

struct User: Decodable {
    let id: Int
    let name: String?
    let username: String?
    let email: String?
}
