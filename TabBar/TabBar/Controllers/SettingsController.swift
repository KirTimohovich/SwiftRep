//
//  SettingsController.swift
//  TabBar
//
//  Created by Kiryl on 29.07.25.
//

import UIKit

class SettingsController: UIViewController {
    
    private let titleText = UILabel()
    private let transferButton = UIButton()
    
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
        
        transferButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(transferButton)
                
        let headerView = UIView()
        headerView.backgroundColor = UIColor.gray.withAlphaComponent(0.5) // Полупрозрачный серый
        headerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerView)
                
        titleText.text = "Настройки"
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
            
            transferButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            transferButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func setTransferButtonTitle(title: String) {
        transferButton.setTitle(title, for: .normal)
    }
    
}
