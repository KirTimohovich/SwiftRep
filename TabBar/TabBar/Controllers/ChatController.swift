//
//  ViewController.swift
//  TabBar
//
//  Created by Kiryl on 29.07.25.
//

import UIKit

class ChatController: UIViewController {
    
    private let titleText = UILabel()
    
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
        
        titleText.text = "Чат"
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
            titleText.centerYAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -24)
        ])
    }
    
}


