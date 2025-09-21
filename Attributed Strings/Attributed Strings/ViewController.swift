import UIKit
class ViewController: UIViewController {
    
    let titleText = UILabel()
    let textView = UITextView()
    let buttonReset = UIButton()
    let buttonAttribute = UIButton()
    let stackView = UIStackView()
    var originalAttributedText: NSAttributedString?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        titleText.text = "Домашняя работа"
        
        let attributedString = NSMutableAttributedString(string: titleText.text!)
        attributedString.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 0, length: 8))
        attributedString.addAttribute(.foregroundColor, value: UIColor.green, range: NSString(string: titleText.text!).range(of: "работа"))
        attributedString.addAttribute(.font, value: UIFont(name: "walgreensscriptfreeversion", size: 40) ?? "", range: NSRange(location: 0, length: titleText.text!.count))
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: titleText.text!.count))
        attributedString.addAttribute(.underlineColor, value: UIColor.systemBlue, range: NSRange(location: 0, length: titleText.text!.count))
        titleText.attributedText = attributedString
        
        let fullString = NSMutableAttributedString(string: "Переходи по ссылке \n для проверки моей домашки \n \n \n ")
        fullString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 22), range: NSRange(location: 0, length: fullString.length))
        fullString.addAttribute(.foregroundColor, value: UIColor.black, range: NSRange(location: 0, length: 9 ))
        fullString.addAttribute(.foregroundColor, value: UIColor.systemBlue, range: NSRange(location: 9, length: 16 ))
        fullString.addAttribute(.foregroundColor, value: UIColor.secondaryLabel, range: NSRange(location: 18, length: 21 ))
        fullString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSString(string: fullString.string).range(of: "для проверки моей домашки"))
        fullString.addAttribute(.underlineColor, value: UIColor.systemRed, range: NSRange(location: 18, length: 28))
     
        originalAttributedText = fullString
        textView.attributedText = originalAttributedText
        
        let linkAttributes: [NSAttributedString.Key : Any] = [
            .font: UIFont.boldSystemFont(ofSize: 22),
            .foregroundColor: UIColor.blue,
            .underlineStyle: NSUnderlineStyle.single.rawValue,
            .link: URL(string: "https://github.com/Pavel-Lobuzov/HomeWork/")!
        ]
        
        fullString.append(NSMutableAttributedString(string: "нажимать сюда \n \n \n", attributes: linkAttributes))
        textView.attributedText = fullString
        textView.backgroundColor = .systemGray6
        
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.addArrangedSubview(buttonReset)
        stackView.addArrangedSubview(buttonAttribute)
        stackView.distribution = .fillEqually
        
        if let image = UIImage(named: "pica") {
            let attachment = NSTextAttachment()
            attachment.image = image
            attachment.bounds = CGRect(x: 0, y: 0, width: 200, height: 200)
            let image = NSAttributedString(attachment: attachment)
            fullString.append(image)
        }
        textView.attributedText = fullString
        
        buttonReset.setTitle( "Отлючить атрибуты", for: .normal)
        buttonReset.backgroundColor = .systemGray6
        buttonReset.setTitleColor(.red, for: .normal)
        buttonReset.layer.cornerRadius = 6
        buttonReset.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        
        buttonAttribute.setTitle( "Включить атрибуты", for: .normal)
        buttonAttribute.backgroundColor = .systemGray6
        buttonAttribute.setTitleColor(.green, for: .normal)
        buttonAttribute.layer.cornerRadius = 6
        buttonAttribute.addTarget(self, action: #selector(attributeButtonTapped), for: .touchUpInside)
        
        
        
        [titleText, stackView,textView].forEach {
            view.addSubview( $0 )
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            titleText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            titleText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(greaterThanOrEqualToConstant: 60),
            
            textView.topAnchor.constraint(equalTo: titleText.topAnchor, constant: 50),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textView.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -50),
            
        ])
        
    }
    @objc private func resetButtonTapped() {
        textView.attributedText = nil
                textView.text = originalAttributedText?.string
    }
    @objc private func attributeButtonTapped() {
            textView.attributedText = originalAttributedText
        }
    }

