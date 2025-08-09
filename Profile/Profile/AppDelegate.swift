
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let profileViewController = ProfileViewController()
        let profileNavigationController = UINavigationController(rootViewController: profileViewController)
        profileViewController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person.crop.circle"), tag: 0)
        
        let editProfileViewController = EditProfileViewController()
        let editProfileNavigationController = UINavigationController(rootViewController: editProfileViewController)
        editProfileViewController.tabBarItem = UITabBarItem(title: "Настройки", image: UIImage(systemName: "gearshape"), tag: 1)
        
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [profileNavigationController, editProfileNavigationController]
        
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        UITabBar.appearance().tintColor = .systemBlue // цвет выбранной иконки и текста
        UITabBar.appearance().unselectedItemTintColor = .white
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }
    
}

