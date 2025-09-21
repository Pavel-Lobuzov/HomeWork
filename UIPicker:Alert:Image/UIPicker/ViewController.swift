import UIKit
class ViewController: UIViewController,
                      UIPickerViewDelegate,
                      UIPickerViewDataSource,
                      UIImagePickerControllerDelegate,
                      UINavigationControllerDelegate {
    
    let button = UIButton()
    let buttonView = UIButton()
    let buttonCamera = UIButton()
    let regionsPicker = UIPickerView()
    let regions = ["Брест", "Витебск", "Гомель", "Минск", "Могилёв"]
    let selectRegions = UILabel()
    let selectImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        view.backgroundColor = .systemBackground
        
        [button, regionsPicker, selectRegions,buttonView,selectImageView,buttonCamera].forEach {
            view.addSubview( $0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        regionsPicker.delegate = self
        regionsPicker.dataSource = self
        regionsPicker.backgroundColor = .systemBackground
        
        selectImageView.contentMode = .scaleAspectFit
        selectImageView.tintColor = .systemBlue
    
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        NSLayoutConstraint.activate([
            regionsPicker.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 10),
            regionsPicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            regionsPicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            selectRegions.bottomAnchor.constraint(equalTo: regionsPicker.bottomAnchor)
            
            ])
        
        NSLayoutConstraint.activate([
            buttonView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            buttonView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            selectImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            selectImageView.bottomAnchor.constraint(equalTo: buttonView.bottomAnchor, constant: 315),
            selectImageView.widthAnchor.constraint(equalToConstant: 300),
            selectImageView.heightAnchor.constraint(equalToConstant: 300),
        ])
        
        NSLayoutConstraint.activate([
            buttonCamera.centerXAnchor.constraint(equalTo: buttonView.centerXAnchor),
            buttonCamera.bottomAnchor.constraint(equalTo: buttonView.bottomAnchor, constant: 50),
            buttonCamera.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonCamera.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
    func setupButton() {
        button.setTitle("Показать сообщение", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        button.addTarget(self, action: #selector(showButton), for: .touchUpInside)
        
        buttonView.setTitle("Выбрать изображение", for: .normal)
        buttonView.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        buttonView.setTitleColor(.black, for: .normal)
        buttonView.backgroundColor = .systemBlue
        buttonView.layer.cornerRadius = 8
        buttonView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        buttonView.addTarget(self, action: #selector(showButtonView), for: .touchUpInside)
        
        buttonCamera.setTitle( "Сделать фото", for: .normal)
        buttonCamera.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        buttonCamera.setTitleColor(.black, for: .normal)
        buttonCamera.backgroundColor = .systemGray
        buttonCamera.layer.cornerRadius = 8
        buttonCamera.heightAnchor.constraint(equalToConstant: 44).isActive = true
        buttonCamera.addTarget(self, action: #selector(showButtonCamera), for: .touchUpInside)
    }
    
    @objc private func showButton() {
        let showAlert = UIAlertController(title: "Важное сообщение!", message: "Спасибо что смотришь домашку!", preferredStyle: .alert)
        
        showAlert.addAction(UIAlertAction(title: "Ок", style: .default) { _ in self.hello("Спасибо!")
        })
        
        showAlert.addAction(UIAlertAction(title: "Закрыть", style: .destructive))
        
        present(showAlert, animated: true)
        
        }
    
    private func hello(_ message: String) {
        let showAlert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        showAlert.addAction(UIAlertAction(title: "Закрыть", style: .cancel))
        present(showAlert, animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
     
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return regions.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return regions[row]
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectRegions.text = " Выбран регион: \(regions[row])"
        selectRegions.textColor = .systemBlue
        selectRegions.font = UIFont.systemFont(ofSize: 25)
    }
    
    @objc private func showButtonView() {
        let image = UIImagePickerController()
        image.sourceType = .photoLibrary
        present(image, animated: true)
        image.delegate = self
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else { return }
        selectImageView.image = image
        dismiss(animated: true)
    }
    
    @objc private func showButtonCamera() {
        let camera = UIImagePickerController()
        camera.sourceType = .camera
        present(camera, animated: true)
        camera.delegate = self
    }
}
