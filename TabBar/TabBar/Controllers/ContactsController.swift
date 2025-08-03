//
//  ContactsPageController.swift
//  TabBar
//
//  Created by Kiryl on 29.07.25.
//
import UIKit

class ContactsController: UIViewController {
    
    class UserProfile {
        var name: String
        var age: Int
        var email: String
        
        init(name: String, age: Int, email: String) {
            self.name = name
            self.age = age
            self.email = email
        }
    }
    
    let userInfo = ContactsController.UserProfile(name: "Кирилл", age: 29, email: "kirilltimtk@gmail.com")
    private let titleText = UILabel()
    private let transferButton = UIButton()
    private let pushContactInfo = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
       
    private func setUI() {
        pushContactInfo.setTitle("Отобразить контакт", for: .normal)
        pushContactInfo.setTitleColor(.white, for: .normal)
        pushContactInfo.backgroundColor = .systemBlue
        pushContactInfo.layer.cornerRadius = 8
        pushContactInfo.addTarget(self, action: #selector(pushUserInfo), for: .touchUpInside)
        pushContactInfo.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pushContactInfo)
        
        transferButton.setTitle("Передать текст в 5-й контроллер", for: .normal)
        transferButton.setTitleColor(.white, for: .normal)
        transferButton.backgroundColor = .systemBlue
        transferButton.layer.cornerRadius = 8
        transferButton.addTarget(self, action: #selector(transferButtonTapped), for: .touchUpInside)
        transferButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(transferButton)
        
        let backgroundImageView = UIImageView(frame: view.bounds)
        backgroundImageView.image = UIImage(named: "backgroundImage")
        backgroundImageView.contentMode = .scaleAspectFill
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        
        let headerView = UIView()
        headerView.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerView)
        
        titleText.text = "Контакты"
        titleText.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        titleText.textColor = .white
        titleText.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(titleText)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            titleText.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            titleText.centerYAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -24),
            
            transferButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            transferButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            transferButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            pushContactInfo.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            pushContactInfo.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            pushContactInfo.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func transferButtonTapped() {
        let settingsViewController = SettingsController()
        settingsViewController.setTransferButtonTitle(title: "KyKy")
        navigationController?.pushViewController(settingsViewController, animated: true)
    }
    
    @objc private func pushUserInfo() {
        let filesViewController = FilesController()
        filesViewController.updateContactInfo(userInfo: userInfo)
        navigationController?.pushViewController(filesViewController, animated: true)
    }
    
}

