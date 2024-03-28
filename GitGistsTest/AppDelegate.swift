//
//  AppDelegate.swift
//  GitGistsTest
//
//  Created by Евгений колесников on 28.03.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
       window =  UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = StartViewController(nibName: nil, bundle: nil)
        window?.makeKeyAndVisible()
        
        return true
    }
}

