//
//  TabBarController.swift
//  IOS-Example
//
//  Created by Александр Арсенюк on 25.04.2021.
//

import UIKit

class TabBarController: UITabBarController {
    
   // MARK: - Init
    
    init(
        firstViewController: UIViewController,
        secondViewController: UIViewController,
        theirdViewController: UIViewController
    ) {
        super.init(nibName: nil, bundle: nil)
        
        let albumsViewController = UINavigationController(
            rootViewController: firstViewController
        )
        albumsViewController.tabBarItem = UITabBarItem(
            title: "Albums",
            image: UIImage(named: "albumsIcon"),
            tag: 0
        )
        
        setViewControllers(
            [
                albumsViewController,
                secondViewController,
                theirdViewController
            ],
            animated: false
        )
        self.selectedIndex = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
