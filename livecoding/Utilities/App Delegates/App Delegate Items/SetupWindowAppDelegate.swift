//
//  SetupWindowAppDelegate.swift
//  livecoding
//
//  Created by Hosein Abbaspour on 3/9/24.
//

import UIKit

class SetupWindowAppDelegate: AppDelegateType {
    
    // MARK: - Properties
    var window: UIWindow?
    var mainCoordinator: MainCoordinator?
    
    // MARK: - Methods
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        mainCoordinator = MainCoordinator(
            router: NavigationRouter(UINavigationController())
        )
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = mainCoordinator?.router.navigationController
        window?.makeKeyAndVisible()
        
        mainCoordinator?.route(animated: false, onDismissed: nil)
        
        return true
    }
}
