//
//  CollectionViewController.swift
//  Table and collection
//
//  Created by Kiryl on 17.08.25.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 350, height: 200)
        layout.minimumInteritemSpacing = 25
        layout.minimumLineSpacing = 25
        layout.sectionInset = UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 40)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    let deviceSymbols = [
        "iphone", "ipad", "macbook", "applewatch", "airpods",
        "desktopcomputer", "laptopcomputer", "display", "tv", "homepod"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return deviceSymbols.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        // Настройка внешнего вида ячейки
        cell.backgroundColor = .systemGray6
        cell.layer.cornerRadius = 12
        
        let symbolName = deviceSymbols[indexPath.item]
        let config = UIImage.SymbolConfiguration(pointSize: 50, weight: .regular)
        let image = UIImage(systemName: symbolName, withConfiguration: config)
        
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemBlue
        
        cell.backgroundView = imageView
        
        return cell
    }
}

