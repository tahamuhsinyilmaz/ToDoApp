//
//  AddToDoPresenter.swift
//  GetirTodo
//
//  Created by onedio on 1.01.2021.
//

import UIKit

class AddToDoPresenter{
    let viewController: AddViewController
    let interactor = AddToDoInteractor()
    private let router = AppRouter()
    
    init(viewController: AddViewController){
        self.viewController = viewController
    }
    
    func addToDo(title: String, description: String?){
        interactor.addToDo(title: title, description: description, completion: {
           [weak self] (isSuccess, error) in
            self?.router.popToRoot()
        })
    }
    
    func updateTodo(id: String, title: String, description: String, isDone: Bool){
        interactor.updateTodo(id: id, title: title, description: description, isDone: isDone, completion: {
            [weak self] (isSuccess, error) in
            self?.router.popToRoot()
        })
    }
    
    private func isValid(title: String, description: String)->Bool{
        return !(title.isEmpty) && !(description.isEmpty)
    }
    
    func addButtonClicked(todo: ToDo?, title: String, description: String){
        if isValid(title: title, description: description){
            if let todo = todo{
                updateTodo(id: todo.id, title: title, description: description, isDone: todo.isDone)
            }else{
                addToDo(title: title, description: description)
            }
        }else{
            AlertHandler.showAlert(title: "", message: Strings.shared.fillTheBlanksWarning, hostVC: self.viewController)
        }
    }
}
