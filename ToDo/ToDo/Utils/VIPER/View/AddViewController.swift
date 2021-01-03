//
//  AddViewController.swift
//  GetirTodo
//
//  Created by onedio on 1.01.2021.
//

import UIKit

class AddViewController: UIViewController {
    
    private var todo: ToDo?
    private let titleTextField = UITextField()
    private let descriptionLabel =  UILabel()
    private let descriptionTextView =  UITextView()
    private let addButton = UIButton()
    
    private var presenter: AddToDoPresenter!{
        let presenter = AddToDoPresenter(viewController: self)
        return presenter
    }
    
    init(todo: ToDo?) {
        self.todo = todo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func setUpUI(){
        self.view.backgroundColor = .white
        setUpTitle()
        setUpTextField()
        setUpDescriptionLabel()
        setDescriptionTextView()
        setUpAddButton()
    }
    
    private func setUpTitle(){
        if let _ = self.todo{
            self.title = Strings.shared.updatePageTitle
        }else{
            self.title = Strings.shared.addPageTitle
        }
    }
    
    private func setUpTextField(){
        if let todo = self.todo{
            titleTextField.text = todo.title
        }
        titleTextField.placeholder = Strings.shared.titlePlaceholder
        self.view.addSubview(titleTextField)
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.borderStyle = .roundedRect
        NSLayoutConstraint.activate([
            titleTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            titleTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            titleTextField.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100)
        ])
    }
    
    private func setUpDescriptionLabel(){
        descriptionLabel.text = Strings.shared.descriptionPlaceholder
        descriptionLabel.textColor = .lightGray
        descriptionLabel.font = UIFont.systemFont(ofSize: 12)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: titleTextField.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleTextField.trailingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 20)
        ])
    }
    
    private func setDescriptionTextView(){
        if let todo = self.todo{
            descriptionTextView.text = todo.toDoDescription
        }else{
            descriptionTextView.text = ""
        }
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        descriptionTextView.layer.borderWidth = 0.5
        descriptionTextView.layer.cornerRadius = 5
        self.view.addSubview(descriptionTextView)
        NSLayoutConstraint.activate([
            descriptionTextView.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            descriptionTextView.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor),
            descriptionTextView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            descriptionTextView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setUpAddButton(){
        if let _ = self.todo{
            addButton.setTitle(Strings.shared.update, for: .normal)
        }else{
            addButton.setTitle(Strings.shared.add, for: .normal)
        }
        addButton.layer.cornerRadius = 5
        addButton.backgroundColor = .appColor
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.addTarget(self, action: #selector(addButtonAction), for: .touchUpInside)
        self.view.addSubview(addButton)
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 20),
            addButton.leadingAnchor.constraint(equalTo: descriptionTextView.leadingAnchor, constant: 30),
            addButton.trailingAnchor.constraint(equalTo: descriptionTextView.trailingAnchor, constant: -30),
            addButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc func addButtonAction(){
        self.presenter.addButtonClicked(todo: self.todo, title: titleTextField.text ?? "", description: descriptionTextView.text ?? "")
    }

}
