//
//  itemCustomCall.swift
//  Collection
//
//  Created by Павел Лобузов on 7.09.25.
//

import SwiftUI

class ItemCustomCall: UICollectionViewCell {
    
    static let reuseId = "itemCustomCall"
    let titleLable = UILabel()
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(item: Item) {
   titleLable.text = item.title
        imageView.image = UIImage(systemName: item.imageName)
    }
    
    private func  setup() {
        contentView.backgroundColor = UIColor.systemGray3
        contentView.layer.cornerRadius = 16
        
        titleLable.font = .systemFont(ofSize: 16, weight: .medium)
        titleLable.textAlignment = .center
        imageView.contentMode = .scaleAspectFit
        
        [imageView, titleLable].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            titleLable.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            titleLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
            ])
            
    }
}
