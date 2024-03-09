//
//  AppDelegate.swift
//  quandoo
//
//  Created by Hosein Abbaspour on 3/9/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Properties
    let appDelegateComposite = AppDelegateComposite([
        SetupWindowAppDelegate()
    ])
    
    // MARK: - Methods
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        appDelegateComposite.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        appDelegateComposite.applicationDidBecomeActive(application)
    }

}
