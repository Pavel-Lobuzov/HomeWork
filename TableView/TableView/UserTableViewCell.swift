//
//  UserTableViewCell.swift
//  TableView
//
//  Created by Павел Лобузов on 23.08.25.
//
import UIKit

class UserTableViewCell: UITableViewCell {
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let avatarImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func configurationCell(_ user: User) {
        titleLabel.text = user.name
        subtitleLabel.text = user.surname
        avatarImageView.image = UIImage(systemName: "person.circle")
    }
    
    private func setupLayout() {
        titleLabel.font = UIFont.systemFont(ofSize: 24)
        subtitleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        let infoStackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        infoStackView.axis = .vertical
        infoStackView.spacing = 20
        
        
        [infoStackView, avatarImageView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            infoStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            infoStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            infoStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            avatarImageView.widthAnchor.constraint(equalToConstant: 30),
            avatarImageView.heightAnchor.constraint(equalToConstant: 30),
            avatarImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            avatarImageView.leadingAnchor.constraint(equalTo: infoStackView.trailingAnchor, constant: 16),
            avatarImageView.centerYAnchor.constraint(equalTo: infoStackView.centerYAnchor),
            ])
        }
    }
    

