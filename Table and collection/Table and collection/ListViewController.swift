//
//  ViewController.swift
//  Table and collection
//
//  Created by Kiryl on 17.08.25.

//1. Вывести 20 ячеек. Для первых 10 ячеек выводится в textLabel текущий индекс, в
//detailTextLabel текущая секция, стиль ячейки с двумя label. Для вторых 10
//выводятся языки программирования, у ячеек стиль стандартный с одним label.
//Итого таблица с 20 ячеек.

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView()
    
    let programmingLanguages = [
        "Swift", "Python", "JavaScript", "Java", "C++",
        "C#", "Ruby", "Go", "Rust", "Kotlin"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Индекс"
        } else {
            return "Языки программирования"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 10
        } else {
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell
        
        if indexPath.section == 0 {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
            cell.textLabel?.text = "Индекс: \(indexPath.row)"
            cell.detailTextLabel?.text = "Секция: \(indexPath.section)"
            cell.accessoryType = .disclosureIndicator
        } else {
            cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
            cell.textLabel?.text = programmingLanguages[indexPath.row]
            cell.accessoryType = .detailButton
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 0 {
            if indexPath.row < 10 {
                print("Выбрана ячейка с индексом: \(indexPath.row), секция: \(indexPath.section)")
            }
        } else {
            let languageIndex = indexPath.row
            print("Выбран язык программирования: \(programmingLanguages[languageIndex])")
        }
    }
}

