//
//  HomeViewController.swift
//  Instagram
//
//  Created by sanaz bahmankhah on 08/12/2022.
//

import UIKit

final class HomeViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configViewControllers()
    }

    func configViewControllers() {
        tabBar.backgroundColor = .white
        let feed = templateNavigationController(selectedtedImage: UIImage(systemName: "house.fill"), unselectedtedImage: UIImage(systemName: "house"), rootViewControlller: FeedViewController())
        let search = templateNavigationController(selectedtedImage: UIImage(systemName: "magnifyingglass"), unselectedtedImage: UIImage(systemName: "magnifyingglass"), rootViewControlller: SearchViewController())
        let imageSelector = templateNavigationController(selectedtedImage: UIImage(systemName: "plus.square.fill"), unselectedtedImage: UIImage(systemName: "plus.square"), rootViewControlller: ImageSelectorViewController())
        let notification = templateNavigationController(selectedtedImage: UIImage(systemName: "bell.fill"), unselectedtedImage: UIImage(systemName: "bell"), rootViewControlller: NotificationViewController())
        let profile = templateNavigationController(selectedtedImage: UIImage(systemName: "person.fill"), unselectedtedImage: UIImage(systemName: "person"), rootViewControlller: ProfileViewController())
        viewControllers = [feed, search, imageSelector, notification, profile]
    }
    
    func templateNavigationController(selectedtedImage: UIImage?, unselectedtedImage: UIImage?,  rootViewControlller: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewControlller)
        nav.tabBarItem.image = unselectedtedImage
        nav.tabBarItem.selectedImage = selectedtedImage?.withTintColor(.black, renderingMode: .alwaysOriginal)
        return nav
    }
}
