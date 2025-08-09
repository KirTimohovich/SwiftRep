//
//  EditProfileViewController.swift
//  Profile
//
//  Created by Kiryl on 9.08.25.
//
import UIKit

class EditProfileViewController: UIViewController {
    
    var infoOnSaveCompletion: ((String, String, String) -> ())?
    let setNameLabel = UITextField()
    let setEmailLabel = UITextField()
    let setUserNumberLabel = UITextField()
    let saveButton = UIButton()
    let stackView = UIStackView()
    var errorLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Редактирование профиля"
        setUpProfile()
    }
    func setUpProfile() {
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.layer.cornerRadius = 12
        stackView.clipsToBounds = true
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        
        setNameLabel.placeholder = "Введите имя"
        setEmailLabel.placeholder = "Введите email"
        setUserNumberLabel.placeholder = "Введите номер в формате +375..."
        
        let _: () = [setNameLabel, setEmailLabel, setUserNumberLabel].forEach {
            $0.backgroundColor = .secondarySystemBackground
            $0.textColor = .label
            $0.borderStyle = .roundedRect
            $0.layer.cornerRadius = 8
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.systemGray4.cgColor
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.heightAnchor.constraint(equalToConstant: 44).isActive = true
            stackView.addArrangedSubview($0)
        }
        
        errorLabel.text = " "
        errorLabel.textColor = .red
        errorLabel.numberOfLines = 0
        errorLabel.textAlignment = .center
        errorLabel.adjustsFontSizeToFitWidth = true
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.minimumScaleFactor = 0.5
        view.addSubview(errorLabel)
        
        NSLayoutConstraint.activate([
            errorLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            errorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            errorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        saveButton.setTitle("Сохранить изменения", for: .normal)
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.backgroundColor = .systemBlue
        saveButton.layer.cornerRadius = 12
        saveButton.addTarget(self, action: #selector(saveOnTapped), for: .touchUpInside)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(saveButton)
        
        NSLayoutConstraint.activate([
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.topAnchor.constraint(equalTo: errorLabel.bottomAnchor, constant: 20),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            saveButton.heightAnchor.constraint(equalToConstant: 40),
            saveButton.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
            
        ])
    }
    
    func isValidName(_ name: String?) -> Bool {
        guard let name = name, !name.isEmpty else {
            return false
        }
        return true
    }
    
    func isValidEmail(_ email: String?) -> Bool {
        guard let email = email else { return false }
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    func isValidPhone(_ phone: String?) -> Bool {
        let phoneRegex = "^[+0-9]{10,15}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return predicate.evaluate(with: phone)
    }
    
    
    
    @objc func saveOnTapped() {
        errorLabel.text = ""
        
        let isNameValid = isValidName(setNameLabel.text)
        let isEmailValid = isValidEmail(setEmailLabel.text)
        let isPhoneValid = isValidPhone(setUserNumberLabel.text)
        
        if isNameValid && isEmailValid && isPhoneValid {
            infoOnSaveCompletion?(
                setNameLabel.text ?? "",
                setEmailLabel.text ?? "",
                setUserNumberLabel.text ?? ""
            )
            navigationController?.popViewController(animated: true)
            
        } else {
            
            var errors = [String]()
            if !isNameValid { errors.append("Имя не может быть пустым") }
            if !isEmailValid { errors.append("Некорректный email") }
            if !isPhoneValid { errors.append("Некорректный номер телефона") }
            
            errorLabel.text = errors.joined(separator: "\n")
        }        
    }
}
