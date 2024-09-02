//
//  HomeViewController.swift
//  Store-ios
//
//  Created by TaeWook Park on 9/1/24.
//

import UIKit

class HomeViewController: UIViewController {

    enum Section: Int {
        case banner
        case horizontalProductItem
    }
    
    
    // Collection View
    @IBOutlet weak var collectionView: UICollectionView!
    
    // Using a compositional layout and diffable data source to efficiently manage and display collection view items
    private var dataSource: UICollectionViewDiffableDataSource<Section, AnyHashable>?
    private var compositionalLayout: UICollectionViewCompositionalLayout = {
        
        // Configure compositional layout based on the section type
        UICollectionViewCompositionalLayout { section, _ in
            switch Section(rawValue: section) {
                
            // main banner slide(carousel)
            case .banner:
                
                // Define the size for each item in the collection view
                let itemSize : NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item: NSCollectionLayoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                
                // Define the size and layout for each group, with a fixed aspect ratio for the banners
                let groupSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(165 / 393))
                let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                // Create a section with the group, enabling carousel-like scrolling behavior
                let section: NSCollectionLayoutSection = NSCollectionLayoutSection(group: group)
                
                // Enable carousel-like scrolling for the banner section
                section.orthogonalScrollingBehavior = .groupPaging
                
                // Return the compositional layout for the collection view
                return section
                
            // center product carousel
            case .horizontalProductItem:
                
                // Define the size for each item in the collection view
                let itemSize : NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item: NSCollectionLayoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                
                // Set the group size with a fixed width of 117 and an estimated height of 224
                let groupSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .absolute(117), heightDimension: .estimated(224))
                let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                // Create a section with the group, enabling carousel-like scrolling behavior
                let section: NSCollectionLayoutSection = NSCollectionLayoutSection(group: group)
                
                // Enable carousel-like scrolling for the banner section
                section.orthogonalScrollingBehavior = .continuous
                
                // section margin
                section.contentInsets = .init(top: 20, leading: 33, bottom: 0, trailing: 33)
                
                // Return the compositional layout for the collection view
                return section
                
            case .none: return nil
            }
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, viewModel in
            
            switch Section(rawValue: indexPath.section) {
                
            case .banner:
                guard let viewModel = viewModel as? HomeBannerCollectionViewCellViewModel,
                      let cell: HomeBannerCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeBannerCollectionViewCell", for: indexPath) as? HomeBannerCollectionViewCell else {
                    return .init()
                }
                cell.setViewModel(viewModel)
                return cell
                
            case .horizontalProductItem:
                guard let viewModel = viewModel as? HomeProductCollectionViewCellViewModel,
                      let cell: HomeProductCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeProductCollectionViewCell", for: indexPath) as? HomeProductCollectionViewCell else {
                    return .init()
                }
                
                cell.setViewModel(viewModel)
                return cell
                
            case .none:
                return .init()
            }
            

        })
        
        // Snapshot
        var snapShot: NSDiffableDataSourceSnapshot<Section, AnyHashable> = NSDiffableDataSourceSnapshot<Section, AnyHashable>()
        snapShot.appendSections([.banner])
        
        // Banner View Model
        snapShot.appendItems([
            HomeBannerCollectionViewCellViewModel(bannerImage: UIImage(resource: .slide1)),
            HomeBannerCollectionViewCellViewModel(bannerImage: UIImage(resource: .slide2)),
            HomeBannerCollectionViewCellViewModel(bannerImage: UIImage(resource: .slide3))],
                             toSection: .banner)
        
        snapShot.appendSections([.horizontalProductItem])
        snapShot.appendItems([
            HomeProductCollectionViewCellViewModel(imageUrlString: "", title: "title1", reasonDiscountString: "Coupon Discount", originalPrice: "65", discountPrice: "50"),
            HomeProductCollectionViewCellViewModel(imageUrlString: "", title: "title2", reasonDiscountString: "Coupon Discount", originalPrice: "75", discountPrice: "60"),
            HomeProductCollectionViewCellViewModel(imageUrlString: "", title: "title3", reasonDiscountString: "Coupon Discount", originalPrice: "85", discountPrice: "70"),
            HomeProductCollectionViewCellViewModel(imageUrlString: "", title: "title4", reasonDiscountString: "Coupon Discount", originalPrice: "95", discountPrice: "80"),
            HomeProductCollectionViewCellViewModel(imageUrlString: "", title: "title5", reasonDiscountString: "Coupon Discount", originalPrice: "105", discountPrice: "90")], 
                             toSection: .horizontalProductItem)
        
        dataSource?.apply(snapShot)
        
        collectionView.collectionViewLayout = compositionalLayout
    }
}

#Preview {
    UIStoryboard(name: "Home", bundle: nil).instantiateInitialViewController() as! HomeViewController
}
