//
//  UserService.swift
//  quandoo
//
//  Created by Hosein Abbaspour on 3/9/24.
//

import Foundation

class UserService {
    
    // MARK: - Types
    typealias ResultCompletion<T> = (Result<T, Error>) -> Void
    
    // MARK: Properties
    private let networkManager: NetworkManager
    
    // MARK: - Life Cycle
    init(_ networkManager: NetworkManager = .init()) {
        self.networkManager = networkManager
    }
    
    // MARK: - Methods
    func users(_ completion: @escaping ResultCompletion<[User]>) {
        networkManager.responseDecodable(
            of: [User].self,
            endpoint: UserEndpoint.users,
            completion: completion
        )
    }
    
    func posts(by userId: Int, _ completion: @escaping ResultCompletion<[Post]>) {
        networkManager.responseDecodable(
            of: [Post].self,
            endpoint: UserEndpoint.posts(userId: userId),
            completion: completion
        )
    }
}
