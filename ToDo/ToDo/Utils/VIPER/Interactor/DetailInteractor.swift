//
//  DetailInteractor.swift
//  GetirTodo
//
//  Created by onedio on 1.01.2021.
//

import Foundation

class DetailInteractor{
    let handler = RealmHandler()
    
    func deleteObjFromDB(_ obj: ToDo, completion: @escaping (_ isSuccess: Bool, _ error: Error?)->()){
        handler.deleteObject(obj, completion: completion)
    }
    
    func updateObj(toUpdateObj: ToDo, completion: @escaping (_ isSuccess: Bool, _ error: Error?)->()){
        handler.updateObj(id: toUpdateObj.id, title: toUpdateObj.title, description: toUpdateObj.toDoDescription, isDone: !(toUpdateObj.isDone), completion: completion)
    }
}
