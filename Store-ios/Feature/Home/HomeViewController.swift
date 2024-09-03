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
        case verticalProductItem
    }
    
    
    // Collection View
    @IBOutlet weak var collectionView: UICollectionView!
    
    // Using a compositional layout and diffable data source to efficiently manage and display collection view items
    private var dataSource: UICollectionViewDiffableDataSource<Section, AnyHashable>?
    
    // Compositional Layout
    private var compositionalLayout: UICollectionViewCompositionalLayout = setCompositionalLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDataSource()
        applySnapShot()
        
        collectionView.collectionViewLayout = compositionalLayout
    }
    
    private static func setCompositionalLayout() -> UICollectionViewCompositionalLayout {
        
        // Configure compositional layout based on the section type
        UICollectionViewCompositionalLayout { section, _ in
            switch Section(rawValue: section) {
                
            // main banner slide(carousel)
            case .banner:
                return HomeBannerCollectionViewCell.bannerLayout()
                
            // center recommand product carousel
            case .horizontalProductItem:
                return HomeProductCollectionViewCell.horizontalProductItemLayout()
                
            // products slide
            case .verticalProductItem:
                return HomeProductCollectionViewCell.verticalProductItemLayout()
                
            case .none: return nil
            }
        }
    }
    
    private func setDataSource() {
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { [weak self] collectionView, indexPath, viewModel in
            
            switch Section(rawValue: indexPath.section) {
                
            case .banner:
                return self?.bannerCell(collectionView, indexPath, viewModel)
                
            case .horizontalProductItem, .verticalProductItem:
                return self?.productItemCell(collectionView, indexPath, viewModel)
                
            case .none:
                return .init()
            }
        })
    }
    
    private func applySnapShot() {
        // Snapshot
        var snapShot: NSDiffableDataSourceSnapshot<Section, AnyHashable> = NSDiffableDataSourceSnapshot<Section, AnyHashable>()
        snapShot.appendSections([.banner])
        
        // Banner View Model
        snapShot.appendItems([
            HomeBannerCollectionViewCellViewModel(bannerImage: UIImage(resource: .slide1)),
            HomeBannerCollectionViewCellViewModel(bannerImage: UIImage(resource: .slide2)),
            HomeBannerCollectionViewCellViewModel(bannerImage: UIImage(resource: .slide3))],
                             toSection: .banner)
        
        // Home Screen Recommended Products Using Horizontal Carousel
        snapShot.appendSections([.horizontalProductItem])
        snapShot.appendItems([
            HomeProductCollectionViewCellViewModel(imageUrlString: "", title: "title1", reasonDiscountString: "Coupon Discount", originalPrice: "65", discountPrice: "50"),
            HomeProductCollectionViewCellViewModel(imageUrlString: "", title: "title2", reasonDiscountString: "Coupon Discount", originalPrice: "75", discountPrice: "60"),
            HomeProductCollectionViewCellViewModel(imageUrlString: "", title: "title3", reasonDiscountString: "Coupon Discount", originalPrice: "85", discountPrice: "70"),
            HomeProductCollectionViewCellViewModel(imageUrlString: "", title: "title4", reasonDiscountString: "Coupon Discount", originalPrice: "95", discountPrice: "80"),
            HomeProductCollectionViewCellViewModel(imageUrlString: "", title: "title5", reasonDiscountString: "Coupon Discount", originalPrice: "105", discountPrice: "90")],
                             toSection: .horizontalProductItem)
        
        // vertical goods scroll
        snapShot.appendSections([.verticalProductItem])
        snapShot.appendItems([
            HomeProductCollectionViewCellViewModel(imageUrlString: "", title: "product1", reasonDiscountString: "Coupon Discount", originalPrice: "65", discountPrice: "50"),
            HomeProductCollectionViewCellViewModel(imageUrlString: "", title: "product2", reasonDiscountString: "Coupon Discount", originalPrice: "75", discountPrice: "60"),
            HomeProductCollectionViewCellViewModel(imageUrlString: "", title: "product3", reasonDiscountString: "Coupon Discount", originalPrice: "85", discountPrice: "70"),
            HomeProductCollectionViewCellViewModel(imageUrlString: "", title: "product4", reasonDiscountString: "Coupon Discount", originalPrice: "95", discountPrice: "80"),
            HomeProductCollectionViewCellViewModel(imageUrlString: "", title: "product5", reasonDiscountString: "Coupon Discount", originalPrice: "105", discountPrice: "90")],
                             toSection: .verticalProductItem)
        
        dataSource?.apply(snapShot)
    }
    
    private func bannerCell(_ collectionView: UICollectionView, _ indexPath: IndexPath, _ viewModel: AnyHashable) -> UICollectionViewCell {
        guard let viewModel = viewModel as? HomeBannerCollectionViewCellViewModel,
              let cell: HomeBannerCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeBannerCollectionViewCell", for: indexPath) as? HomeBannerCollectionViewCell else {
            return .init()
        }
        cell.setViewModel(viewModel)
        return cell
    }
    
    private func productItemCell(_ collectionView: UICollectionView, _ indexPath: IndexPath, _ viewModel: AnyHashable) -> UICollectionViewCell {
        guard let viewModel = viewModel as? HomeProductCollectionViewCellViewModel,
              let cell: HomeProductCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeProductCollectionViewCell", for: indexPath) as? HomeProductCollectionViewCell else {
            return .init()
        }
        cell.setViewModel(viewModel)
        return cell
    }
}

// ctrl(command) + alt + enter  = preview on/off
#Preview {
    UIStoryboard(name: "Home", bundle: nil).instantiateInitialViewController() as! HomeViewController
}
