//
//  User.swift
//  quandoo
//
//  Created by Hosein Abbaspour on 3/9/24.
//

import Contacts

struct User: Decodable, Hashable {
    
    // MARK: - Properties
    let id: Int
    let name: String?
    let username: String?
    let email: String?
    let address: Address
    
    var addressFormatted: String? {
        let formatter = CNPostalAddressFormatter()
        
        let postalAdress = CNMutablePostalAddress()
        postalAdress.street = address.street
        postalAdress.postalCode = address.zipcode
        postalAdress.city = address.city
        
        return formatter.string(from: postalAdress)
    }
}
