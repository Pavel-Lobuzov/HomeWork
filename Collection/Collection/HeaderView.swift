import UIKit
class HeaderView: UICollectionReusableView {
    static let reuseId = "HeaderView"
  let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(title: String) {
        titleLabel.text = title
    }
private func setup() {
    titleLabel.textColor = UIColor.systemRed
    titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
    titleLabel.textAlignment = .center
    
addSubview(titleLabel)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        
        ])
    }
}


    

