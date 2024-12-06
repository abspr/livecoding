//
//  UsersCoordinator.swift
//  livecoding
//
//  Created by Hosein Abbaspour on 3/9/24.
//

import UIKit

class UsersCoordinator: Coordinator {
    
    // MARK: - Properties
    private var rootViewController: UsersViewController!
    var childCoordinators: [Coordinator] = []
    var router: Router
    
    // MARK: - Life Cycle
    init(router: Router) {
        self.router = router
        router.navigationController.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - Methods
    func route(animated: Bool, onDismissed: (() -> Void)?) {
        rootViewController = UsersViewController()
        rootViewController.coordinator = self
        router.route(to: rootViewController, animated: false, onDismissed: nil)
    }
}

extension UsersCoordinator: UsersViewControllerDelegate {
    
    func routeToPosts(by userId: Int) {
        let postCoordinator = PostsCoordinator(router: router, userId: userId)
        routeToChildCoordinator(postCoordinator, animated: true, onDismissed: nil)
    }
    
}
