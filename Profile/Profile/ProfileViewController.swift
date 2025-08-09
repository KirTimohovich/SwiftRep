//
//  ViewController.swift
//  Profile
//
//  Created by Kiryl on 9.08.25.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let nameLabel = UILabel()
    let emailLabel = UILabel()
    let userNumberLabel = UILabel()
    let editButton = UIButton()
    let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Профиль"
        setUpProfile()
        
        func setUpProfile() {
            stackView.axis = .vertical
            stackView.spacing = 10
            stackView.alignment = .fill
            stackView.distribution = .fillEqually
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.layer.cornerRadius = 12
            
            view.addSubview(stackView)
            
            NSLayoutConstraint.activate([
                stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            ])
            
            [nameLabel, emailLabel, userNumberLabel].forEach {
                $0.numberOfLines = 0
                $0.textAlignment = .center
                $0.textColor = .label
                $0.backgroundColor = .secondarySystemBackground
                $0.layer.cornerRadius = 8
                $0.layer.borderWidth = 1
                $0.layer.borderColor = UIColor.systemGray4.cgColor
                $0.layer.masksToBounds = true
                $0.translatesAutoresizingMaskIntoConstraints = false
                $0.heightAnchor.constraint(equalToConstant: 44).isActive = true
                stackView.addArrangedSubview($0)
            }
            
            nameLabel.text = "Имя"
            emailLabel.text = "Email"
            userNumberLabel.text = "Номер телефона"
            
            editButton.setTitle("Редактировать профиль", for: .normal)
            editButton.setTitleColor(.white, for: .normal)
            editButton.backgroundColor = .systemBlue
            editButton.layer.cornerRadius = 12
            editButton.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
            editButton.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(editButton)
            
            NSLayoutConstraint.activate([
                editButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                editButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 40),
                editButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
                editButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
                editButton.heightAnchor.constraint(equalToConstant: 40)
                
            ])
        }
    }
    
    @objc private func editButtonTapped() {
        let editVC = EditProfileViewController()
        editVC.infoOnSaveCompletion = { name, email, number in
            self.nameLabel.text = name
            self.emailLabel.text = email
            self.userNumberLabel.text = number
        }
        
        navigationController?.pushViewController(editVC, animated: false)
        
    }
}

