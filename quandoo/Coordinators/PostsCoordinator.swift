//
//  PostsCoordinator.swift
//  quandoo
//
//  Created by Hosein Abbaspour on 3/9/24.
//

import UIKit

class PostsCoordinator: Coordinator {
    
    // MARK: - Properties
    var childCoordinators: [Coordinator] = []
    var router: Router
    
    // MARK: - Life Cycle
    init(router: Router) {
        self.router = router
    }
    
    // MARK: - Methods
    func route(animated: Bool, onDismissed: (() -> Void)?) {
        let viewController = PostsViewController(nibName: nil, bundle: nil)
        router.route(to: viewController, animated: true, onDismissed: onDismissed)
    }
    
}
