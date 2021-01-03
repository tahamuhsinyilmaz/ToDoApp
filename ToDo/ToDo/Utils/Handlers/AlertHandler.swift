//
//  AlertHandler.swift
//  GetirTodo
//
//  Created by onedio on 1.01.2021.
//

import UIKit


class AlertHandler{
    class func showAlert(title: String, message: String, hostVC: UIViewController){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        hostVC.present(alertController, animated: true, completion: nil)
    }
    
    class func showConfirmationAlert(title: String, message: String, hostVC: UIViewController, completion: @escaping (_ action: UIAlertAction)->()){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: completion))
        hostVC.present(alertController, animated: true, completion: nil)
    }
}
