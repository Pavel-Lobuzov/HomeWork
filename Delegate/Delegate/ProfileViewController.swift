//
//  ViewController.swift
//  Delegate
//
//  Created by Павел Лобузов on 9.08.25.
//

import UIKit

class ProfileViewController: UIViewController, SetupNameDelegate, SetupPhoneNumberDelegate, SetupEmailDelegate  {

    let nameLable = UILabel()
    let stackView = UIStackView()
    let email = UILabel()
    let phoneNumber = UILabel()
    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func saveNameLable(text: String) {
        nameLable.text = text
    }
    func savePhoneNumber(text: String) {
        phoneNumber.text = text
    }
    func saveEmail(text: String) {
        email.text = text
    }
    
    private func setupUI(){
        view.backgroundColor = .white
        stackView.axis = .vertical
        stackView.spacing = 50
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
     
        nameLable.text = "не задано имя:"
        email.text = "нет Email:"
        phoneNumber.text = "не указан номер телефона:"

        button.setTitle( "Редактировать", for: .normal)
        button.layer.cornerRadius = 16
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonOnPressed), for: .touchUpInside)
        view.addSubview(button)
        
        [nameLable, email, phoneNumber].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview($0)
        }
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:-5),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
           
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    
    }
    @objc private func buttonOnPressed() {
        let nextVC = EditProfileViewController()
        nextVC.delegate = self
        nextVC.delegate2 = self
        nextVC.delegate3 = self
        navigationController?.pushViewController(nextVC, animated: true)
    }
}

