//
//  DetailViewController.swift
//  GetirTodo
//
//  Created by onedio on 1.01.2021.
//

import UIKit

class DetailViewController: UIViewController {

    private let toDo: ToDo
    private let descriptionTextView = UITextView()
    private let buttonStack = UIStackView()
    private var presenter: DetailPresenter!{
        let presenter = DetailPresenter(viewController: self)
        return presenter
    }
    
    
    init(toDo: ToDo) {
        self.toDo = toDo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setUpUI()
        setDescriptionTextView()
        setButtonStack()
    }
    
    private func setUpUI(){
        setTitle()
    }
    
    private func setTitle(){
        self.title = toDo.title
    }
    
    private func setDescriptionTextView(){
        descriptionTextView.text = toDo.toDoDescription
        descriptionTextView.layer.borderWidth = 0.5
        descriptionTextView.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        descriptionTextView.layer.cornerRadius = 5
        descriptionTextView.isEditable = false
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(descriptionTextView)
        NSLayoutConstraint.activate([
            descriptionTextView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            descriptionTextView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            descriptionTextView.topAnchor.constraint(equalTo: self.view.topAnchor, constant:100),
            descriptionTextView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setButtonStack(){
        buttonStack.alignment = .fill
        buttonStack.distribution = .fillEqually
        buttonStack.axis = .vertical
        buttonStack.spacing = 10
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(buttonStack)
        NSLayoutConstraint.activate([
            buttonStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
            buttonStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50),
            buttonStack.topAnchor.constraint(equalTo: self.descriptionTextView.bottomAnchor, constant: 10),
            buttonStack.heightAnchor.constraint(equalToConstant: 170)
        ])
        
        let addButton = UIButton()
        addButton.backgroundColor = .appColor
        addButton.layer.cornerRadius = 5
        addButton.setTitle(Strings.shared.add, for: .normal)
        addButton.addTarget(self, action: #selector(addButtonAction), for: .touchUpInside)
        buttonStack.addArrangedSubview(addButton)
        
        let deleteButton = UIButton()
        deleteButton.backgroundColor = .appColor
        deleteButton.layer.cornerRadius = 5
        deleteButton.setTitle(Strings.shared.delete, for: .normal)
        deleteButton.addTarget(self, action: #selector(deleteButtonAction), for: .touchUpInside)
        buttonStack.addArrangedSubview(deleteButton)
        
        let editButon = UIButton()
        editButon.backgroundColor = .appColor
        editButon.layer.cornerRadius = 5
        editButon.setTitle(Strings.shared.edit, for: .normal)
        editButon.addTarget(self, action: #selector(editButtonAction), for: .touchUpInside)
        buttonStack.addArrangedSubview(editButon)
        
        let doneButton = UIButton()
        doneButton.backgroundColor = .appColor
        doneButton.layer.cornerRadius = 5
        if toDo.isDone{
            doneButton.setTitle(Strings.shared.markUnDone, for: .normal)
        }else{
            doneButton.setTitle(Strings.shared.markDone, for: .normal)
        }
        
        doneButton.addTarget(self, action: #selector(doneButtonAction), for: .touchUpInside)
        buttonStack.addArrangedSubview(doneButton)
    }
    
    
    @objc func addButtonAction(){
        presenter.addButtonClicked()
    }
    
    @objc func deleteButtonAction(){
        presenter.deleteButtonClicked(toDeleteObj: toDo)
    }
    
    @objc func editButtonAction(){
        presenter.editButtonClicked(toEditObj: toDo)
    }
    
    @objc func doneButtonAction(){
        presenter.doneButtonClicked(toEditObj: toDo)
    }
    
}
