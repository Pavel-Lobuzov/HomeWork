//
//  AppDelegate.swift
//  Collection
//
//  Created by Павел Лобузов on 24.08.25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
   
    var window: UIWindow?



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      
        window = UIWindow(frame: UIScreen.main.bounds)
        let startVC = UINavigationController(rootViewController: CollectionViewController())
        window?.rootViewController = startVC
        window?.makeKeyAndVisible()
        return true
    }
}

