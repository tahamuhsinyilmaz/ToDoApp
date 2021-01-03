//
//  AppPresenter.swift
//  GetirTodo
//
//  Created by onedio on 1.01.2021.
//

import Foundation
import UIKit

class HomePresenter: NSObject{
    private let reuseIdentifier: String = "mainReuseID"
    private let viewController: HomeViewController
    private let router = AppRouter()
    private let interractor = HomeInteractor()

    private var toDos: [ToDo]! = []{
        didSet{
            viewController.reloadTable()
        }
    }
    
    init(viewController: HomeViewController){
        self.viewController = viewController
    }
    
    func getReuseID()->String{
        return self.reuseIdentifier
    }
    
    func getCurrentToDos(){
        self.toDos = interractor.fetchToDosFromDB()
    }
    
    
    //MARK: - User Interractions
    
    func tableSelected(_ indexPath: IndexPath){
        let todo = toDos[indexPath.row]
        router.showDetailPage(todo: todo)
    }
    
    func addButtonClicked(){
        self.router.showAddPage(initialTodo: nil)
    }
    
    
}

    //MARK: - Table Data Source
extension HomePresenter: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as! MainTableViewCell
        cell.toDo = self.toDos[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            AlertHandler.showConfirmationAlert(title: "", message: Strings.shared.sureForDelete, hostVC: viewController) {[weak self] (action) in
                guard let obj = self?.toDos[indexPath.row] else {return}
                self?.interractor.deleteObjFromDB(obj, completion: {
                    [weak self] (isSuccess, error) in
                    if isSuccess{
                        self?.getCurrentToDos()
                    }else{
                        AlertHandler.showAlert(title: Strings.shared.error, message: error?.localizedDescription ?? "", hostVC: self!.viewController)
                    }
                })
                
            }
        }
    }
    
    
}
