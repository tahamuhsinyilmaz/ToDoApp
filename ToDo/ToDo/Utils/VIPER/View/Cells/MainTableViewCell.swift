//
//  MainTableViewCell.swift
//  GetirTodo
//
//  Created by onedio on 1.01.2021.
//

import UIKit

class MainTableViewCell: UITableViewCell{
    var toDo: ToDo!{
        didSet{
            updateUI()
        }
    }
    
    private func updateUI(){
        updateLabel()
        updateImage()
    }
    
    private func updateLabel(){
        self.textLabel?.text = toDo.title
    }
    
    private func updateImage(){
        if toDo.isDone{
            imageView?.image = .checkmark
        }else{
            imageView?.image = nil
        }
    }
}
