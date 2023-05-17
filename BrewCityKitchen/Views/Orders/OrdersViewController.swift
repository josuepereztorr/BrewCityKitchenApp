//
//  OrdersViewController.swift
//  BrewCityKitchen
//
//  Created by Josue Perez Torres on 5/15/23.
//

import UIKit

class OrdersViewController: UIViewController {
    
    enum Section {
        case main
    }
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Int>! = nil
    
    var collectionView: UICollectionView! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Orders"
        
        configureHierarchy()
        configureDataSource()
    }
    
    private func setupTabBarImage(imageName: String, title: String) {
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 2)
    }
    
    private func configureHierarchy() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        collectionView.register(OrderCollectionViewCell.self, forCellWithReuseIdentifier: OrderCollectionViewCell.cellIdentifier)
        view.addSubview(collectionView)
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(0.1))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    private func configureDataSource() {
        
        // Create Diffable Data Source and connect to Collection View
        // has a @escaping closure
        dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexpath: IndexPath, identifier: Int) -> UICollectionViewCell? in
            
            // a contructor that passes the collection view as input, and returns a cell as output
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: OrderCollectionViewCell.cellIdentifier,
                for: indexpath) as? OrderCollectionViewCell else {
                fatalError("Cannot create new cell")
            }
            
            return cell
        }
        
        // initial data
        var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
        snapshot.appendSections([.main])
        snapshot.appendItems(Array(0..<2))
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}
