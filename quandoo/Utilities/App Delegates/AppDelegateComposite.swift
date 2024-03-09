//
//  AppDelegateComposite.swift
//  quandoo
//
//  Created by Hosein Abbaspour on 3/9/24.
//

import UIKit

typealias AppDelegateType = UIResponder & UIApplicationDelegate

class AppDelegateComposite: AppDelegateType {
    
    // MARK: - Properties
    private let appDelegates: [AppDelegateType]
    
    // MARK: - Life Cycle
    init(_ appDelegates: [AppDelegateType]) {
        self.appDelegates = appDelegates
    }
    
    //MARK: - UIApplicationDelegate Methods
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        appDelegates.forEach({ _ = $0.application?(application, didFinishLaunchingWithOptions: launchOptions) })
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        appDelegates.forEach({ $0.applicationDidBecomeActive?(application) })
    }

}
