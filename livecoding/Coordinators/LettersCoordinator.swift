//
//  LettersCoordinator.swift
//  livecoding
//
//  Created by Hosein Abbaspour on 12/5/24.
//

import UIKit

class LettersCoordinator: Coordinator {
    
    // MARK: - Properties
    var childCoordinators: [Coordinator] = []
    var router: Router
    private let letters: [String]
    
    // MARK: - Life Cycle
    init(router: Router, letters: [String]) {
        self.router = router
        self.letters = letters
    }
    
    // MARK: - Methods
    func route(animated: Bool, onDismissed: (() -> Void)?) {
        let controller = LettersViewController(.init(letters))
        router.route(to: controller, animated: true, onDismissed: onDismissed)
    }
    
}
