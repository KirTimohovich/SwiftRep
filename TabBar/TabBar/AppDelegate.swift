//
//  AppDelegate.swift
//  TabBar
//
//  Created by Kiryl on 29.07.25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let chatViewController = ChatController()
        let chatNavigationController = UINavigationController(rootViewController: chatViewController)
        chatViewController.tabBarItem = UITabBarItem(title: "Чат", image: UIImage(systemName: "message"), tag: 0)
        
        let contactsViewController = ContactsController()
        let contactsNavigationController = UINavigationController(rootViewController: contactsViewController)
        contactsViewController.tabBarItem = UITabBarItem(title: "Контакты", image: UIImage(systemName: "person.crop.circle"), tag: 1)
        
        let settingsViewController = SettingsController()
        let settingsNavigationController = UINavigationController(rootViewController: settingsViewController)
        settingsViewController.tabBarItem = UITabBarItem(title: "Настройки", image: UIImage(systemName: "gear"), tag: 2)
        
        let searchViewController = SearchController()
        let searchNavigationController = UINavigationController(rootViewController: searchViewController)
        searchViewController.tabBarItem = UITabBarItem(title: "Поиск", image: UIImage(systemName: "magnifyingglass"), tag: 3)
        
        let filesViewController = FilesController()
        let filesNavigationController = UINavigationController(rootViewController: filesViewController)
        filesViewController.tabBarItem = UITabBarItem(title: "Файлы", image: UIImage(systemName: "folder"), tag: 4)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [contactsNavigationController, filesNavigationController, chatNavigationController, searchNavigationController, settingsNavigationController]
        
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        UITabBar.appearance().tintColor = .systemBlue // цвет выбранной иконки и текста
        UITabBar.appearance().unselectedItemTintColor = .white
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }
    
}

