//
//  Post.swift
//  livecoding
//
//  Created by Hosein Abbaspour on 3/10/24.
//

import Foundation

struct Post: Decodable, Identifiable {
    let id: Int
    let title: String
    let body: String
}
