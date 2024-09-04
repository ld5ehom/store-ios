//
//  HomeViewController.swift
//  Store-ios
//
//  Created by TaeWook Park on 9/1/24.
//
import Combine
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
    
    // Home View Model
    private var viewModel: HomeViewModel = HomeViewModel()
    
    // view controller life cycle
    private var cancellables: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindingViewModel()
        setDataSource()
        
        // API data
        collectionView.collectionViewLayout = compositionalLayout
        
        // HomeViewModel loadData
        viewModel.process(action: .loadData)
        
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
    
    // HomeViewModel Binding
    private func bindingViewModel() {
        viewModel.state.$collectionViewModels.receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.applySnapShot()
            }.store(in: &cancellables)
    }
    
    // Data Source
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
    
    // Applies a snapshot to the collection view, adding sections and items based on available view models.
    private func applySnapShot() {
        
        // Initialize a snapshot to manage the sections and items in the collection view.
        var snapShot: NSDiffableDataSourceSnapshot<Section, AnyHashable> = NSDiffableDataSourceSnapshot<Section, AnyHashable>()
        
        // Add banner section and items to the snapshot only if bannerViewModels are present.
        if let bannerViewModels = viewModel.state.collectionViewModels.bannerViewModels {
            snapShot.appendSections([.banner])
            snapShot.appendItems(bannerViewModels, toSection: .banner)
        }
            
        // Add horizontal product section and items to the snapshot only if horizontalProductViewModels are present in the view model.
        if let horizontalProductViewModels = viewModel.state.collectionViewModels.horizontalProductViewModels {
            snapShot.appendSections([.horizontalProductItem])
            snapShot.appendItems(horizontalProductViewModels, toSection: .horizontalProductItem)
        }
        
        // Add vertical product section and items to the snapshot only if verticalProductViewModels are present in the view model.
        if let verticalProductViewModels = viewModel.state.collectionViewModels.verticalProductViewModels {
            snapShot.appendSections([.verticalProductItem])
            snapShot.appendItems(verticalProductViewModels, toSection: .verticalProductItem)
        }
        
        dataSource?.apply(snapShot)
    }

    
    // Banner carousel Cell
    private func bannerCell(_ collectionView: UICollectionView, _ indexPath: IndexPath, _ viewModel: AnyHashable) -> UICollectionViewCell {
        guard let viewModel = viewModel as? HomeBannerCollectionViewCellViewModel,
              let cell: HomeBannerCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeBannerCollectionViewCell", for: indexPath) as? HomeBannerCollectionViewCell else {
            return .init()
        }
        cell.setViewModel(viewModel)
        return cell
    }
    
    // Product Cell
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
