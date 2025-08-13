//
//  seccondViewController.swift
//  Delegate
//
//  Created by Павел Лобузов on 9.08.25.
//
import UIKit
class EditProfileViewController: UIViewController {
    weak var delegate:  SetupNameDelegate?
    weak var delegate2: SetupEmailDelegate?
    weak var delegate3: SetupPhoneNumberDelegate?
   
    let infoStackView = UIStackView()
    let nameTextField = UITextField()
    let emailTextField = UITextField()
    let phoneNumberTextField = UITextField()
    let saveButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    private func setupUI() {
     
        infoStackView.axis = .vertical
        infoStackView.spacing = 50
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(infoStackView)
   
        nameTextField.placeholder = "Имя"
        nameTextField.borderStyle = .roundedRect
     
        emailTextField.placeholder = "@Email"
        emailTextField.borderStyle = .roundedRect
     
        phoneNumberTextField.placeholder = "Номер телефона"
        phoneNumberTextField.borderStyle = .roundedRect
        
        saveButton.backgroundColor = .systemBlue
        saveButton.layer.cornerRadius = 16
        saveButton.setTitle( "Сохранить", for: .normal)
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        
        [nameTextField, emailTextField, phoneNumberTextField,UIView(),saveButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            infoStackView.addArrangedSubview($0)
        }
        
        NSLayoutConstraint.activate([
            saveButton.heightAnchor.constraint(equalToConstant: 50),
            infoStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            infoStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            infoStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            infoStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            ])
   
    }
    @objc func saveButtonTapped() {
        delegate?.saveNameLable(text: "Имя: \(nameTextField.text ?? "")")
        delegate2?.saveEmail(text: "Email: \(emailTextField.text ?? "")")
        delegate3?.savePhoneNumber(text: "Телефон: \(phoneNumberTextField.text ?? "")")
        navigationController?.popViewController(animated: true)
        }
    
}
