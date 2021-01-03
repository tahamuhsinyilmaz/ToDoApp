//
//  ToDo.swift
//  GetirTodo
//
//  Created by onedio on 1.01.2021.
//

import Foundation
import RealmSwift

class ToDo: Object {
    @objc dynamic var id =  UUID().uuidString
    @objc dynamic var title = ""
    @objc dynamic var toDoDescription = ""
    @objc dynamic var isDone = false
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

