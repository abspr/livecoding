//
//  UsersCoordinator.swift
//  quandoo
//
//  Created by Hosein Abbaspour on 3/9/24.
//

import UIKit

class UsersCoordinator: Coordinator {
    
    // MARK: - Properties
    var childCoordinators: [Coordinator] = []
    var router: Router
    
    // MARK: - Life Cycle
    init(router: Router) {
        self.router = router
    }
    
    // MARK: - Methods
    func route(animated: Bool, onDismissed: (() -> Void)?) {
        let viewController = UsersViewController(nibName: nil, bundle: nil)
        viewController.coordinator = self
        router.route(to: viewController, animated: false, onDismissed: nil)
    }
}

extension UsersCoordinator: UsersViewControllerDelegate {
    
    func routeToPost() {
        let postCoordinator = PostsCoordinator(router: router)
        routeToChildCoordinator(postCoordinator, animated: true, onDismissed: nil)
    }
    
}
