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
        
        loadData()
        setDataSource()
        
        // API data
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
    
    // Asynchronously loads data from the API, maps the JSON response to view models for banners and products, and applies them to the collection view snapshot.
    private func loadData() {
        Task {
            do {
                let response = try await NetworkService.shared.getHomeData()
                
                let bannerViewModels = response.banners.map {
                    HomeBannerCollectionViewCellViewModel(bannerImageUrl: $0.imageUrl)
                }
                
                let horizontalProductViewModels = response.horizontalProducts.map {
                    HomeProductCollectionViewCellViewModel(imageUrlString: $0.imageUrl,
                                                           title: $0.title,
                                                           reasonDiscountString: $0.discount,
                                                           originalPrice: "\($0.originalPrice)",
                                                           discountPrice: "\($0.discountPrice)")
                }
                
                let verticalProductViewModels = response.verticalProducts.map {
                    HomeProductCollectionViewCellViewModel(imageUrlString: $0.imageUrl,
                                                           title: $0.title,
                                                           reasonDiscountString: $0.discount,
                                                           originalPrice: "\($0.originalPrice)",
                                                           discountPrice: "\($0.discountPrice)")
                }
                
                applySnapShot(bannerViewModels: bannerViewModels, 
                              horizontalProductViewModels: horizontalProductViewModels,
                              verticalProductViewModels: verticalProductViewModels)

            } catch {
                print("network error: \(error)")
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
    
    private func applySnapShot(bannerViewModels: [HomeBannerCollectionViewCellViewModel],
                               horizontalProductViewModels: [HomeProductCollectionViewCellViewModel],
                               verticalProductViewModels: [HomeProductCollectionViewCellViewModel]) {
        // Snapshot
        var snapShot: NSDiffableDataSourceSnapshot<Section, AnyHashable> = NSDiffableDataSourceSnapshot<Section, AnyHashable>()
        
        // Banner Section
        snapShot.appendSections([.banner])
        snapShot.appendItems(bannerViewModels, toSection: .banner)
        
        // Horizontal Product Section
        snapShot.appendSections([.horizontalProductItem])
        snapShot.appendItems(horizontalProductViewModels, toSection: .horizontalProductItem)
        
        // Vertical Product Section
        snapShot.appendSections([.verticalProductItem])
        snapShot.appendItems(verticalProductViewModels, toSection: .verticalProductItem)
        
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
