//
//  HomeViewController.swift
//  Store-ios
//
//  Created by TaeWook Park on 9/1/24.
//
import Combine
import UIKit

final class HomeViewController: UIViewController {

    // typealias
    private typealias DataSource = UICollectionViewDiffableDataSource<Section, AnyHashable>
    private typealias SnapShot = NSDiffableDataSourceSnapshot<Section, AnyHashable>
    
    private enum Section: Int {
        case banner
        case horizontalProductItem
        case separateLine1
        case couponButton
        case verticalProductItem
        case separateLine2
        case theme
    }
    
    // Collection View
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // Using a compositional layout and diffable data source to efficiently manage and display collection view items
    private lazy var dataSource: DataSource = setDataSource()
    
    // Compositional Layout
    private lazy var compositionalLayout: UICollectionViewCompositionalLayout = setCompositionalLayout()
    
    // Home View Model
    private var viewModel: HomeViewModel = HomeViewModel()
    
    // view controller life cycle
    private var cancellables: Set<AnyCancellable> = []
    
    // Coupon current section
    private var currentSection: [Section] {
        dataSource.snapshot().sectionIdentifiers as [Section]
    }
    
    // coupon button key
    private var didTapCouponButton: PassthroughSubject<Void, Never> = PassthroughSubject<Void, Never>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindingViewModel()
        
        // API data
        collectionView.collectionViewLayout = compositionalLayout
        
        // HomeViewModel loadData
        viewModel.process(action: .loadData)
        
        // load coupon
        viewModel.process(action: .loadCoupon)
        
    }
    
    private func setCompositionalLayout() -> UICollectionViewCompositionalLayout {
        
        // Configure compositional layout based on the section type
        UICollectionViewCompositionalLayout { [weak self] section, _ in
            switch self?.currentSection[section] {
                
            // main banner slide(carousel)
            case .banner:
                return HomeBannerCollectionViewCell.bannerLayout()
                
            // center recommand product carousel
            case .horizontalProductItem:
                return HomeProductCollectionViewCell.horizontalProductItemLayout()
                
            // products slide
            case .verticalProductItem:
                return HomeProductCollectionViewCell.verticalProductItemLayout()
                
            // coupon Button
            case .couponButton:
                return HomeCouponButtonCollectionViewCell.couponButtonItemLayout()
                
            // separate line
            case .separateLine1, .separateLine2:
                return HomeSeparateLineCollectionViewCell.separateLineLayout()
                
            // theme
            case .theme:
                return HomeThemeCollectionViewCell.themeLayout()
                
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
        
        didTapCouponButton.receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.viewModel.process(action: .didTapCouponButton)
            }.store(in: &cancellables)
    }
    
    // Data Source
    private func setDataSource() -> DataSource {
        let dataSource: DataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { [weak self] collectionView, indexPath, viewModel in
            
            switch self?.currentSection[indexPath.section] {
                
            case .banner:
                return self?.bannerCell(collectionView, indexPath, viewModel)
                
            case .horizontalProductItem, .verticalProductItem:
                return self?.productItemCell(collectionView, indexPath, viewModel)
                
            case .couponButton:
                return self?.couponButtonCell(collectionView, indexPath, viewModel)
                
            case .separateLine1, .separateLine2:
                return self?.separateLineCell(collectionView, indexPath, viewModel)
                
            case .theme:
                return self?.themeCell(collectionView, indexPath, viewModel)
                
            case .none:
                return .init()
            }
        })
        
        // Theme Header
        dataSource.supplementaryViewProvider = { [weak self] collectionView, kind, indexPath in
            guard kind == UICollectionView.elementKindSectionHeader,
                  let viewModel = self?.viewModel.state.collectionViewModels.themeViewModels?.headerViewModel else { return nil }
            
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HomeThemeHeaderCollectionReusableView.reusableId, for: indexPath) as? HomeThemeHeaderCollectionReusableView
            headerView?.setViewModel(viewModel)
            return headerView
        }
        
        return dataSource
    }
    
    // Applies a snapshot to the collection view, adding sections and items based on available view models.
    private func applySnapShot() {
        
        // Initialize a snapshot to manage the sections and items in the collection view.
        var snapShot: SnapShot = SnapShot()
        
        // Add banner section and items to the snapshot only if bannerViewModels are present.
        if let bannerViewModels = viewModel.state.collectionViewModels.bannerViewModels {
            snapShot.appendSections([.banner])
            snapShot.appendItems(bannerViewModels, toSection: .banner)
            
            // separate line
            snapShot.appendSections([.separateLine1])
            snapShot.appendItems(viewModel.state.collectionViewModels.separateLine1ViewModels, toSection: .separateLine1)
        }
            
        // Add horizontal product section and items to the snapshot only if horizontalProductViewModels are present in the view model.
        if let horizontalProductViewModels = viewModel.state.collectionViewModels.horizontalProductViewModels {
            snapShot.appendSections([.horizontalProductItem])
            snapShot.appendItems(horizontalProductViewModels, toSection: .horizontalProductItem)
        }
        
        // Coupon button
        if let couponViewModels = viewModel.state.collectionViewModels.couponState {
            snapShot.appendSections([.couponButton])
            snapShot.appendItems(couponViewModels, toSection: .couponButton)
        }
        
        // Add vertical product section and items to the snapshot only if verticalProductViewModels are present in the view model.
        if let verticalProductViewModels = viewModel.state.collectionViewModels.verticalProductViewModels {
            snapShot.appendSections([.verticalProductItem])
            snapShot.appendItems(verticalProductViewModels, toSection: .verticalProductItem)
        }
        
        // Horizontal carousel Theme
        if let themeViewModels = viewModel.state.collectionViewModels.themeViewModels?.items {
            
            // separate line
            snapShot.appendSections([.separateLine2])
            snapShot.appendItems(viewModel.state.collectionViewModels.separateLine1ViewModels, toSection: .separateLine2)
            
            snapShot.appendSections([.theme])
            snapShot.appendItems(themeViewModels, toSection: .theme)
        }
        
        dataSource.apply(snapShot)
    }

    
    // Banner carousel Cell
    private func bannerCell(_ collectionView: UICollectionView, _ indexPath: IndexPath, _ viewModel: AnyHashable) -> UICollectionViewCell {
        guard let viewModel = viewModel as? HomeBannerCollectionViewCellViewModel,
              let cell: HomeBannerCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeBannerCollectionViewCell.reusableId, for: indexPath) as? HomeBannerCollectionViewCell else { return .init() }
        cell.setViewModel(viewModel)
        return cell
    }
    
    // Product Cell
    private func productItemCell(_ collectionView: UICollectionView, _ indexPath: IndexPath, _ viewModel: AnyHashable) -> UICollectionViewCell {
        guard let viewModel = viewModel as? HomeProductCollectionViewCellViewModel,
              let cell: HomeProductCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeProductCollectionViewCell.resuableId, for: indexPath) as? HomeProductCollectionViewCell else { return .init() }
        cell.setViewModel(viewModel)
        return cell
    }
    
    private func couponButtonCell(_ collectionView: UICollectionView, _ indexPath: IndexPath, _ viewModel: AnyHashable) -> UICollectionViewCell {
        guard let viewModel = viewModel as? HomeCouponButtonCollectionViewCellViewModel,
              let cell: HomeCouponButtonCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCouponButtonCollectionViewCell.reusableId, for: indexPath) as? HomeCouponButtonCollectionViewCell else { return .init() }
        cell.setViewModel(viewModel, didTapCouponButton)
        return cell
    }
    
    // separate line
    private func separateLineCell(_ collectionView: UICollectionView, _ indexPath: IndexPath, _ viewModel: AnyHashable) -> UICollectionViewCell {
        guard let viewModel = viewModel as? HomeSeparateLineCollectionViewCellViewModel,
              let cell: HomeSeparateLineCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeSeparateLineCollectionViewCell.reusableId, for: indexPath) as? HomeSeparateLineCollectionViewCell else { return .init() }
        cell.setViewModel(viewModel)
        return cell
    }
    
    // theme cell
    private func themeCell(_ collectionView: UICollectionView, _ indexPath: IndexPath, _ viewModel: AnyHashable) -> UICollectionViewCell {
        guard let viewModel = viewModel as? HomeThemeCollectionViewCellViewModel,
              let cell: HomeThemeCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeThemeCollectionViewCell.reusableId, for: indexPath) as? HomeThemeCollectionViewCell else { return .init() }
        cell.setViewModel(viewModel)
        return cell
    }
}

// ctrl(command) + alt + enter  = preview on/off
#Preview {
    UIStoryboard(name: "Home", bundle: nil).instantiateInitialViewController() as! HomeViewController
}
