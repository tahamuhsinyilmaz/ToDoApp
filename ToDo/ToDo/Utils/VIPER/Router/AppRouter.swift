//
//  AppRouter.swift
//  GetirTodo
//
//  Created by onedio on 1.01.2021.
//

import UIKit

class AppRouter{
    static let mainNavigationController = MainNavigationController()
    
    func showDetailPage(todo: ToDo){
        let detailViewController = DetailViewController(toDo: todo)
        AppRouter.mainNavigationController.show(detailViewController, sender: self)
    }
    
    func showAddPage(initialTodo: ToDo?){
        let addViewController = AddViewController(todo: initialTodo)
        AppRouter.mainNavigationController.show(addViewController, sender: self)
    }
    
    
    func popToRoot(){
        AppRouter.mainNavigationController.popToRootViewController(animated: true)
    }
    
    
}
