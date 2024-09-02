//
//  HomeViewController.swift
//  Store-ios
//
//  Created by TaeWook Park on 9/1/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    enum Section {
        case banner
    }
    
    
    // Collection View
    @IBOutlet weak var collectionView: UICollectionView!
    
    // Using compositional layout and diffable data source to efficiently manage and display collection view items
    private var dataSource: UICollectionViewDiffableDataSource<Section, UIImage>?
    private var compositionalLayout: UICollectionViewCompositionalLayout = {
        let itemSize : NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item: NSCollectionLayoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(165 / 393))
        
        let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section: NSCollectionLayoutSection = NSCollectionLayoutSection(group: group)
        
        // Enable carousel-like scrolling for the banner section
        section.orthogonalScrollingBehavior = .groupPaging
        
        return UICollectionViewCompositionalLayout(section: section)
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell: HomeBannerCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeBannerCollectionViewCell", for: indexPath) as! HomeBannerCollectionViewCell
            cell.setImage(itemIdentifier)
            return cell
        })
        
        // Snapshot
        var snapShot: NSDiffableDataSourceSnapshot<Section, UIImage> = NSDiffableDataSourceSnapshot<Section, UIImage>()
        snapShot.appendSections([.banner])
        
        // itemIdentifier
        snapShot.appendItems([UIImage(resource: .slide1), UIImage(resource: .slide2), UIImage(resource: .slide3)], toSection: .banner)
        
        dataSource?.apply(snapShot)
        
        collectionView.collectionViewLayout = compositionalLayout
    }

}
