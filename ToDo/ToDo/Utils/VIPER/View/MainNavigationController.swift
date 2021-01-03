//
//  MainNavigationController.swift
//  GetirTodo
//
//  Created by onedio on 1.01.2021.
//

import UIKit

class MainNavigationController: UINavigationController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.barTintColor = .appColor
        self.viewControllers.append(HomeViewController())
    }
}
