//
//  CheckoutViewController.swift
//  BrewCityKitchen
//
//  Created by Josue Perez Torres on 5/18/23.
//

import UIKit

class CheckoutViewController: UIViewController {

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .left
        label.text = "Checkout"
//        label.backgroundColor = .green
        return label
    }()
    
    let totalPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .left
        label.text = "Total: $0.00"
//        label.backgroundColor = .green
        return label
    }()
    
    private lazy var checkoutButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "Checkout"
        config.baseBackgroundColor = .black
        config.baseForegroundColor = .white
        config.buttonSize = .large
        config.cornerStyle = .medium
        
        var button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(checkout), for: .touchUpInside)
        return button
    }()
    
    let continueToMenuButton: UIButton = {
        var config = UIButton.Configuration.bordered()
        config.title = "Return to Menu"
        config.baseBackgroundColor = .tertiarySystemBackground
        config.baseForegroundColor = .black
        config.buttonSize = .large
        config.cornerStyle = .medium
        
        let btn = UIButton(configuration: config)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(dismissViewControllers), for: .touchUpInside)
        return btn
    }()
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>! = nil
    
    private let context = CoreDataManager.shared
    
    enum Section {
        case main
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Checkout"
        view.backgroundColor = .systemBackground
        collectionView.delegate = self
        
        setupView()
        configureDataSource()
    }
    
    private func setupView() {

        
        collectionView.register(MenuItemCollectionViewCell.self, forCellWithReuseIdentifier: MenuItemCollectionViewCell.cellIdentifier)
        view.addSubview(collectionView)
        view.addSubview(checkoutButton)
        view.addSubview(continueToMenuButton)
        view.addSubview(titleLabel)
        view.addSubview(totalPriceLabel)
        
        let insetXMain = CGFloat(15)
        let insetYMain = CGFloat(10)
        
//        let insetXComponent = CGFloat(5)
        let insetYComponent = CGFloat(5)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),

            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insetXMain),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -insetXMain),
            
            totalPriceLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 15),
            totalPriceLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: insetXMain),
            totalPriceLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -insetXMain),
            totalPriceLabel.bottomAnchor.constraint(equalTo: checkoutButton.topAnchor, constant: -15),

            checkoutButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: insetXMain),
            checkoutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -insetXMain),

            continueToMenuButton.topAnchor.constraint(equalTo: checkoutButton.bottomAnchor, constant: insetYComponent),
            continueToMenuButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insetXMain),
            continueToMenuButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -insetXMain),
            continueToMenuButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -insetYMain)
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
            
            cell.itemId = identifier.itemId
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

extension CheckoutViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
//        collectionView.deselectItem(at: indexPath, animated: true)
//
//        guard let cell = collectionView.cellForItem(at: indexPath) as? MenuItemCollectionViewCell else {
//                return
//        }
//
//        guard let item = self.context.fetchItem(id: cell.itemId) else {
//            print("fetch request failed because the cell.itemID was null")
//            return
//        }
//
//        let detailViewController = MenuItemDetailViewController(menuItem: item)
//
//        present(detailViewController, animated: true)
    }
}

extension CheckoutViewController {
    @objc private func checkout() {
        
    }
    
    @objc private func dismissViewControllers() {
        guard let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else {
                return
            }
            
            var topViewController = window.rootViewController
            
            // Find the top-most presented view controller
            while let presentedViewController = topViewController?.presentedViewController {
                topViewController = presentedViewController
            }
            
            // Dismiss the top-most presented view controller and its presented view controllers recursively
            while let presentedViewController = topViewController?.presentedViewController {
                presentedViewController.dismiss(animated: true, completion: nil)
                topViewController = presentedViewController
            }
    }
}


