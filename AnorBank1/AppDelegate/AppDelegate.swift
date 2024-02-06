//
//  AppDelegate.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 21/01/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    private let tabBarItemsData = [
        TabBarItemData(image: "house", title: "Main menu", type: MainMenuViewController(presenter: MainPresenter())),
        TabBarItemData(image: "creditcard", title: "Cards", type: CardsViewController(presenter: CardsPresenter())),
        TabBarItemData(image: "case", title: "Payment", type: PaymentViewController(presenter: PaymentPresenter())),
        TabBarItemData(image: "clock.arrow.circlepath", title: "Monitoring", type: MonitoringViewController(presenter: MonitoringPresenter())),
        TabBarItemData(image: "square.split.2x2", title: "All services", type: AllServicesViewController()),
    ]
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let tabBarVC = UITabBarController()
        tabBarVC.viewControllers = createTabBarItems(tabBarItems: tabBarItemsData)
        tabBarVC.selectedIndex = 3
        tabBarVC.tabBar.backgroundColor = .white
        tabBarVC.tabBar.tintColor = .appColor.primary
        tabBarVC.tabBar.layer.cornerRadius = 20
        tabBarVC.tabBar.clipsToBounds = true
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBarVC
        window?.makeKeyAndVisible()
        
        return true
    }
}

extension AppDelegate {
    
    func createTabBarItems(tabBarItems: [TabBarItemData]) -> [UIViewController] {
        var tabBars: [UIViewController] = []
        
        for item in tabBarItems {
            let vc: UIViewController = UINavigationController(rootViewController: item.type)
            
            vc.tabBarItem.title = item.title
            vc.tabBarItem.image = UIImage(systemName: item.image)
            
            tabBars.append(vc)
        }
        return tabBars
    }
}

struct TabBarItemData {
    let image: String
    let title: String
    let type: UIViewController
}

