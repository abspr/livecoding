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
    let service = UserService(.init())

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .systemBackground
        
        service.users { result in
            switch result {
            case .success(let users):
                print(users.map({ $0.id }))
                
            case .failure(let error):
                print(error)
            }
        }
    }

    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        coordinator?.routeToPost()
    }

}

