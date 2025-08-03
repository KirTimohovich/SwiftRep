//
//  MainController.swift
//  TabBar
//
//  Created by Kiryl on 3.08.25.
//
import UIKit

class FilesController: UIViewController {
    
    private let titleText = UILabel()
    private var nameLabel = UILabel()
    private var ageLabel = UILabel()
    private var emailLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        let backgroundImageView = UIImageView(frame: view.bounds)
        backgroundImageView.image = UIImage(named: "backgroundImage")
        backgroundImageView.contentMode = .scaleAspectFill
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        
        let headerView = UIView()
        headerView.backgroundColor = UIColor.gray.withAlphaComponent(0.5) // Полупрозрачный серый
        headerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerView)
        
        [nameLabel, ageLabel, emailLabel].forEach {
            $0.textColor = .black
            $0.font = UIFont.systemFont(ofSize: 16)
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        titleText.text = "Файлы"
        titleText.font = UIFont.systemFont(ofSize: 18, weight:  .bold)
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
            
            nameLabel.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 40),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            ageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            ageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            emailLabel.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 20),
            emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func updateContactInfo(userInfo: ContactsController.UserProfile) {
        nameLabel.text = "Имя: \(userInfo.name)"
        ageLabel.text = "Возраст: \(userInfo.age)"
        emailLabel.text = "Email: \(userInfo.email)"
    }
    
}
