//
//  Untitled.swift
//  TabBar
//
//  Created by Kiryl on 3.08.25.
//
import UIKit

class SearchController: UIViewController {
    private let titleText = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        configureNavBar()
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
        
        titleText.text = "Поиск"
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
    
    private func configureNavBar() {
        let leftButton = UIBarButtonItem(title: "Отмена", style: .plain, target: self, action: #selector(leftButtonTapped))
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.leftBarButtonItem?.tintColor = .red
        
        let firstRightButton = UIBarButtonItem(image: UIImage(systemName: "house"), style: .plain, target: self, action: #selector(firstRightButtonTapped))
        
        let secRightButton = UIBarButtonItem(image: UIImage(systemName: "trash"), style: .plain, target: self, action: #selector(secRightButtonTapped))
        
        navigationItem.rightBarButtonItems = [firstRightButton, secRightButton]
    }
    
    @objc private func leftButtonTapped() {
        print("left")
    }
    
    @objc private func firstRightButtonTapped() {
        print("1-right")
    }
    
    @objc private func secRightButtonTapped() {
        print("2-right")
    }
    
}




