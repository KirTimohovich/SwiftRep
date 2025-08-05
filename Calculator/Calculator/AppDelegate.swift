//
//  AppDelegate.swift
//  Calculator
//
//  Created by Kiryl on 5.08.25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = CalculatorController()
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }



}

