//
//  ViewController.swift
//  Lojong-Test
//
//  Created by João Tribuzy on 11/03/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import UIKit

public var tabBarHeigh: CGFloat = 0

class MainTabBarViewController: UITabBarController{
    
    let fundamentViewController = UIViewController()
    let insightViewController = InsightMainViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.settingTabs()
        
        self.style()
        self.autolayout()
    
        tabBarHeigh = self.tabBar.frame.height
    }
    
    //MARK: - Tabs Configuration
    private func settingTabs(){
        
        fundamentViewController.tabBarItem = UITabBarItem(title: NSLocalizedString("Fundaments", comment: ""), image: UIImage.init(named: "Fundaments-Item"), tag: 0)
        
        insightViewController.tabBarItem = UITabBarItem(title: NSLocalizedString("Insight", comment: ""), image: UIImage.init(named: "Insight-Item"), tag: 1)
        
        let tabBarList = [fundamentViewController, insightViewController]

        viewControllers = tabBarList
    }
}

