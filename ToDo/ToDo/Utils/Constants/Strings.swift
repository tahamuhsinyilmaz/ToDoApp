//
//  Strings.swift
//  GetirTodo
//
//  Created by onedio on 1.01.2021.
//

import Foundation


class Strings{
    private init(){}
    static var shared = Strings()
    
    //MARK: - App strings
    let add = "Add"
    let delete = "Delete"
    let edit = "Edit"
    let update = "Update"
    let markDone = "Mark As Done"
    let markUnDone = "Mark As Undone"
    let descriptionPlaceholder = "Description:"
    let titlePlaceholder = "To Do Title..."
    let fillTheBlanksWarning = "Please fill the empty areas"
    let sureForDelete = "Are you sure to delete?"
    let sureForClear = "Are you sure to clear?"
    let error = "Error"
    
    
    
    //MARK: - Page Titles
    let addPageTitle = "Add To Do"
    let homePageTitle = "To Do List"
    let updatePageTitle = "Update To Do"
}
