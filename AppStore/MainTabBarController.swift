//
//  MainTabBarController.swift
//  AppStore
//
//  Created by Amar Bhatia on 7/7/17.
//  Copyright © 2017 AmarBhatia. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllers()
        
    }
    
    
    func setupViewControllers() {
        
        let layout = UICollectionViewFlowLayout()

        let featuredController = FeaturedAppsController(collectionViewLayout: layout)
        let featuredNavController = UINavigationController(rootViewController: featuredController)
        featuredNavController.tabBarItem.title = "Featured"
        featuredNavController.tabBarItem.image = UIImage(named: "Featured")

        
        let categoriesController = CategoriesController()
        let categoriesNavController = UINavigationController(rootViewController: categoriesController)
        categoriesNavController.tabBarItem.title = "Categories"
        categoriesNavController.tabBarItem.image = UIImage(named: "List")
        
        let topChartsController = TopChartsController()
        let topChartsNavController = UINavigationController(rootViewController: topChartsController)
        topChartsNavController.tabBarItem.title = "Top Charts"
        topChartsNavController.tabBarItem.image = UIImage(named: "List")

        let searchController = SearchController()
        let searchNavController = UINavigationController(rootViewController: searchController)
        searchNavController.tabBarItem.title = "Search"
        searchNavController.tabBarItem.image = UIImage(named: "Search")
        
        let updatesController = UpdatesController()
        let updatesNavController = UINavigationController(rootViewController: updatesController)
        updatesNavController.tabBarItem.title = "Updates"
        updatesNavController.tabBarItem.image = UIImage(named: "Updates")
        
        viewControllers = [featuredNavController, categoriesNavController, topChartsNavController, searchNavController, updatesNavController]
    }
    
    fileprivate func templateNavController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController = UIViewController()) -> UINavigationController {
        let viewController = rootViewController
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = unselectedImage
        navController.tabBarItem.selectedImage = selectedImage
        return navController
    }

}
