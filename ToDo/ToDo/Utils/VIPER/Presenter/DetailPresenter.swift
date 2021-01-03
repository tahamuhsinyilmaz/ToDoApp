//
//  DetailPresenter.swift
//  GetirTodo
//
//  Created by onedio on 1.01.2021.
//

import Foundation

class DetailPresenter{
    let viewController: DetailViewController
    let interactor = DetailInteractor()
    let router = AppRouter()
    
    init(viewController: DetailViewController){
        self.viewController = viewController
    }
    
    func addButtonClicked(){
        router.showAddPage(initialTodo: nil)
    }
    
    func editButtonClicked(toEditObj: ToDo){
        router.showAddPage(initialTodo: toEditObj)
    }
    
    func deleteButtonClicked(toDeleteObj: ToDo){
        AlertHandler.showConfirmationAlert(title: "", message: Strings.shared.sureForDelete, hostVC: self.viewController) { (action) in
            self.interactor.deleteObjFromDB(toDeleteObj, completion: {
                [weak self] (isSuccess, error) in
                if isSuccess{
                    self?.router.popToRoot()
                }else{
                    AlertHandler.showAlert(title: Strings.shared.error, message: error?.localizedDescription ?? "", hostVC: self!.viewController)
                }
             })
        }
    }
    
    func doneButtonClicked(toEditObj: ToDo){
        self.interactor.updateObj(toUpdateObj: toEditObj) {[weak self] (isSuccess, error) in
            if isSuccess{
                self?.router.popToRoot()
            }else{
                AlertHandler.showAlert(title: Strings.shared.error, message: error?.localizedDescription ?? "", hostVC: self!.viewController)
            }
        }
    }
}
