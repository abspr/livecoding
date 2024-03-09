//
//  Router.swift
//  quandoo
//
//  Created by Hosein Abbaspour on 3/9/24.
//

import UIKit

public protocol Router: AnyObject {
    
    var navigationController: UINavigationController { get set }
    
    func route(to viewController: UIViewController, animated: Bool, onDismissed: (() -> Void)?)
    func unroute(animated: Bool)
}
