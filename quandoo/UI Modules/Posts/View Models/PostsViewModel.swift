//
//  PostsViewModel.swift
//  quandoo
//
//  Created by Hosein Abbaspour on 3/9/24.
//

import Foundation

class PostsViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var posts: [Post] = []
    private var service: UserService
    
    // MARK: - Life Cycle
    init(_ servie: UserService = .init(), userId: Int) {
        self.service = servie
        fetchPosts(by: userId)
    }
    
    // MARK: - Methods
    private func fetchPosts(by userId: Int) {
        service.posts(by: userId) { [weak self] result in
            switch result {
            case .success(let posts):
                self?.posts = posts
                
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}
