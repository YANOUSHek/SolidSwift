//
//  AppDelegate.swift
//  makeyourappgreatagain
//
//  Created by Aleksander Lorenc on 20/09/2017.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.setAppearance()

        return true
    }

    func setAppearance() {
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.customRed], for: .selected)

        UITabBar.appearance().tintColor = .customRed

        UIBarButtonItem.appearance().tintColor = .customRed

        UINavigationBar.appearance().barTintColor = .customGray
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.customRed]
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.customRed]
    }
}
