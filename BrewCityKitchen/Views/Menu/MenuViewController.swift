//
//  MenuViewController.swift
//  BrewCityKitchen
//
//  Created by Josue Perez Torres on 5/16/23.
//

import UIKit

class MenuViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>! = nil
    private let context = CoreDataManager.shared
    private let viewModel = MenuListViewModel()
    
    enum Section {
        case main
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Menu"
        view.backgroundColor = .systemBackground
        collectionView.delegate = self
        
        setupView()
        configureDataSource()
    }
    
    private func setupView() {
        collectionView.register(MenuItemCollectionViewCell.self, forCellWithReuseIdentifier: MenuItemCollectionViewCell.cellIdentifier)
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .absolute(80))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    private func configureDataSource() {
    
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexpath: IndexPath, identifier: Item) -> UICollectionViewCell? in
            
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: MenuItemCollectionViewCell.cellIdentifier,
                for: indexpath) as? MenuItemCollectionViewCell else {
                fatalError("Cannot create new cell")
            }
            
//            let item = context.fetchItem(id: identifier.objectID)
            
            cell.nameLabel.text = identifier.itemName
            cell.priceLabel.text = "$\(identifier.itemPrice)"
            
            return cell
        }
        

        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(context.fetchItems(), toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: false)
    }

}

extension MenuViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let item = Item(context: context.context)
        let detailViewController = MenuItemDetailViewController(menuItem: viewModel.menuItems[indexPath.row])
        present(detailViewController, animated: true)
    }
}
