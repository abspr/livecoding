//
//  MainCoordinator.swift
//  livecoding
//
//  Created by Hosein Abbaspour on 3/9/24.
//

import Foundation

class MainCoordinator: Coordinator {
   
    // MARK: - Properties
    var childCoordinators: [Coordinator] = []
    var router: Router
    
    // MARK: - Life Cycle
    init(router: Router) {
        self.router = router
    }
    
    // MARK: - Methods
    func route(animated: Bool, onDismissed: (() -> Void)?) {
        let userCoordinator = UsersCoordinator(router: router)
        routeToChildCoordinator(userCoordinator, animated: false, onDismissed: onDismissed)
    }
}
