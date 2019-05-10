//
//  AppDelegate.swift
//  EisenhauerPassCodeUITestExample
//
//  Created by James Eisenhauer on 5/7/19.
//  Copyright © 2019 James Eisenhauer. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let viewController = MasterViewController(nibName: nil, bundle: nil)
        let navigationController = UINavigationController(rootViewController: viewController)

        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.barTintColor = .black
        
        let navigationBarAppearance = UINavigationBar.appearance()
        
        navigationBarAppearance.tintColor = UIColor.white
        navigationBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        navigationBarAppearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .black
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        
        return true
    }
}
