//
//  AppDelegate.swift
//  XcodeTemplateProject
//
//  Created by Mikhail Zhigulin in 7531.
//
//  Copyright © 7531 Mikhail Zhigulin of Novosibirsk.
//  Licensed under the special license. See LICENSE file.
//  All rights reserved.
//

import UIKit

// MARK: - The Business Matter Application Delegate

class AppDelegate: UIResponder { var window: UIWindow? }

extension AppDelegate: UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions
        launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        #if DEBUG
        print(">> Launching with real app delegate")
        print(">> [\(type(of: self))]." + #function)
        #endif
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        #if false
        // window!.rootViewController = ViewController()
        #else
        window!.rootViewController = MainViewController.storyboardInstance()
        #endif

        window!.makeKeyAndVisible()

        return true
    }
}
