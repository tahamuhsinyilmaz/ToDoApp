//
//  AppInteractor.swift
//  GetirTodo
//
//  Created by onedio on 1.01.2021.
//

import Foundation

class HomeInteractor{
    let handler = RealmHandler<ToDo>()
    
    func fetchToDosFromDB()->[ToDo]{
        return handler.query("")
    }
    
    func deleteObjFromDB(_ obj: ToDo, completion: @escaping (_ isSuccess: Bool, _ error: Error?)->()){
        handler.deleteObject(obj, completion: completion)
    }
    
    
}
