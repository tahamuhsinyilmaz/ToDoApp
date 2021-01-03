//
//  MainView.swift
//  GetirTodo
//
//  Created by onedio on 1.01.2021.
//

import UIKit

class HomeViewController: UIViewController {
    

    private var tableView: UITableView!
    private var presenter: HomePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = HomePresenter(viewController: self)
        initTableView()
        initNavBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.getCurrentToDos()
    }
    
    private func initNavBar(){
        self.title = Strings.shared.homePageTitle
        
        let rightItem = UIBarButtonItem(image: .add, style: .plain, target: self, action: #selector(addButtonAction))
        self.navigationItem.setRightBarButton(rightItem, animated: false)
        
        let leftItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(clearButtonAction))
        leftItem.tintColor = .red
        self.navigationItem.setLeftBarButton(leftItem, animated: false)
    }
    
    
    private func initTableView(){
        tableView = UITableView()
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: presenter.getReuseID())
        tableView.dataSource = presenter
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    func reloadTable(){
        self.tableView.reloadData()
    }
    
    func startEditing(){
        let item = (UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(doneButtonAction)))
        self.navigationItem.leftBarButtonItems?.insert(item, at: 0)
        tableView.isEditing = true
    }
    
    func endEditing(){
        self.navigationItem.leftBarButtonItems?.removeFirst()
        tableView.isEditing = false
    }
    
    @objc func addButtonAction(){
        self.presenter.addButtonClicked()
    }
    
    @objc func clearButtonAction(){
        startEditing()
    }
    
    @objc func doneButtonAction(){
        endEditing()
    }
    
}

extension HomeViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.tableSelected(indexPath)
    }
}
