//
//  PostsCoordinator.swift
//  quandoo
//
//  Created by Hosein Abbaspour on 3/9/24.
//

import SwiftUI

class PostsCoordinator: Coordinator {
    
    // MARK: - Properties
    var childCoordinators: [Coordinator] = []
    var router: Router
    private let userId: Int
    
    // MARK: - Life Cycle
    init(router: Router, userId: Int) {
        self.router = router
        self.userId = userId
    }
    
    // MARK: - Methods
    func route(animated: Bool, onDismissed: (() -> Void)?) {
        let postView = PostsView(viewModel: .init(userId: userId))
        let viewController = UIHostingController(rootView: postView)
        router.route(to: viewController, animated: true, onDismissed: onDismissed)
    }
    
}
