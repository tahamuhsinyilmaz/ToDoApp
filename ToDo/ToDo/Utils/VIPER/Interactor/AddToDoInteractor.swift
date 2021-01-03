//
//  AddToDoInteractor.swift
//  GetirTodo
//
//  Created by onedio on 1.01.2021.
//

import Foundation


class AddToDoInteractor{
    let handler = RealmHandler()
    
    func addToDo(title: String, description: String?, completion: @escaping (_ isSuccess: Bool, _ error: Error?)->()){
        let obj = ToDo()
        obj.isDone = false
        obj.title = title
        obj.toDoDescription = description ?? ""
        handler.writeObject(obj, completion: completion)
    }
    
    func updateTodo(id: String, title: String, description: String, isDone: Bool, completion: @escaping (_ isSuccess: Bool?, _ error: Error?)->()){
        handler.updateObj(id: id, title: title, description: description, isDone: isDone, completion: completion)
    }
}
