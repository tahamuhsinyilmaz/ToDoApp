//
//  RealmHandler.swift
//  GetirTodo
//
//  Created by onedio on 1.01.2021.
//

import Foundation
import RealmSwift

class RealmHandler<T:Object>{
    private var realm: Realm!
    
    
    init(){
        do{
            self.realm =  try Realm()
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func query(_ filterString: String)->[T]{
        let results: Results<T>
        if filterString == ""{
            results = realm.objects(T.self)
        }else{
            results = realm.objects(T.self).filter(filterString)
        }
        return results.toArray(ofType: T.self)
    }
    
    func writeObject(_ object: T, completion: @escaping (_ isSuccess: Bool, _ error: Error?)->()){
        do{
            try realm.write({
                realm.add(object)
                completion(true, nil)
            })
        }catch{
            print(error.localizedDescription)
            completion(false,error)
        }
    }
    
    func deleteObject(_ object: T, completion: @escaping (_ isSuccess: Bool, _ error: Error?)->()){
        do{
            try realm.write({
                realm.delete(object)
                completion(true, nil)
            })
        }catch{
            print(error.localizedDescription)
            completion(false,error)
        }
    }
    
    func updateObj(id: String, title: String, description: String, isDone: Bool, completion: @escaping (_ isSuccess: Bool, _ error: Error?)->()){
        let dbObj = realm.objects(ToDo.self).filter("id == '\(id)'").first
        do{
            try realm.write({
                dbObj?.toDoDescription = description
                dbObj?.title = title
                dbObj?.isDone = isDone
                completion(true, nil)
            })
        }catch{
            print(error.localizedDescription)
            completion(false,error)
        }
    }
}

extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for i in 0 ..< count {
            if let result = self[i] as? T {
                array.append(result)
            }
        }

        return array
    }
}

