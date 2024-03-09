//
//  UsersViewController.swift
//  quandoo
//
//  Created by Hosein Abbaspour on 3/9/24.
//

import UIKit

protocol UsersViewControllerDelegate: AnyObject {
    func routeToPost()
}

class UsersViewController: UIViewController {
    
    weak var coordinator: UsersViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .systemBackground
    }

    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        coordinator?.routeToPost()
    }

}

