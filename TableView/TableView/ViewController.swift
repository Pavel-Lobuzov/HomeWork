//
//  ViewController.swift
//  TableView
//
//  Created by Павел Лобузов on 18.08.25.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    let tableView = UITableView()
    
    private var users: [User] = [User(name: "Иван", surname: "Иванов", avatarImage: UIImage(systemName: "person.circle") ?? UIImage()),
                                 User(name: "Петр", surname: "Петров", avatarImage: UIImage(systemName: "person.circle") ?? UIImage()),
                                 User(name: "Мария", surname: "Мариевна", avatarImage: UIImage(systemName: "person.circle") ?? UIImage()),
                                 User(name: "Александр", surname: "Александров", avatarImage: UIImage(systemName: "person.circle") ?? UIImage())
                                 
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configurationTableView()
        configurationNavigationItem()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell()
//        var contentConfigutarion = cell.defaultContentConfiguration()
//        contentConfigutarion.text = users[indexPath.row].name
//        contentConfigutarion.secondaryText = users[indexPath.row].surname
//        contentConfigutarion.image = users[indexPath.row].avatarImage
//        contentConfigutarion.secondaryTextProperties.font = UIFont.boldSystemFont(ofSize: 20)
//        
//        var backgroundConfiguration = cell.defaultBackgroundConfiguration()
//        backgroundConfiguration.backgroundColor = .systemGray6
//        cell.contentConfiguration = contentConfigutarion
//        cell.backgroundConfiguration = backgroundConfiguration
//
        let user = users[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        cell.configurationCell(user)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let user = users[sourceIndexPath.row]
        
        users.remove(at: sourceIndexPath.row)
        users.insert(user, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            users.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
      let tableDetailViewController = TableDetail(user: user)
        navigationController?.pushViewController(tableDetailViewController, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }

    
    private func configurationNavigationItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editTapped))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
    }
    @objc private func editTapped() {
        tableView.isEditing.toggle()
    
    }
    @objc private func addTapped() {
        let newUser = User(name: "Pavel", surname: "Lobuzov", avatarImage: UIImage(systemName: "person.circle"))
        users.append(newUser)
       
        let indexPath = IndexPath(row: users.count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    
    private func configurationTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: "UserTableViewCell")
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        navigationItem.title = "Список пользователей"
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}


