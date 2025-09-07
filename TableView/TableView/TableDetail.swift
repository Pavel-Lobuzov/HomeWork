import UIKit
class TableDetail: UIViewController {
  
    let user: User
    let nameLabel = UILabel()
    let surnameLabel = UILabel()
    let avatarImageView = UIImageView()
    
    init(user: User){
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    private func configureUI(){
        view.backgroundColor = .white
        nameLabel.text = user.name
        nameLabel.textAlignment = .center
        nameLabel.font = .systemFont(ofSize: 30, weight: .bold)
        surnameLabel.text = user.surname
        surnameLabel.font = .systemFont(ofSize: 20, weight: .bold)
        surnameLabel.textAlignment = .center
        
        avatarImageView.image = user.avatarImage
        
        [nameLabel, surnameLabel, avatarImageView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            avatarImageView.widthAnchor.constraint(equalToConstant: 50),
            avatarImageView.heightAnchor.constraint(equalToConstant: 50),
            avatarImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatarImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),

            nameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 40),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            surnameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            surnameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            surnameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            
            ])
    }
    
}
