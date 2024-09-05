//
//  HomeViewModel.swift
//  Store-ios
//
//  Created by TaeWook Park on 9/4/24.
//
import Combine
import Foundation

final class HomeViewModel {
    
    enum Action {
        case loadData
        case loadCoupon
        case getDataSuccess(HomeResponse)
        case getDataFailure(Error)
        case getCouponSuccess(Bool)
        case didTapCouponButton
    }
    
    final class State {
        struct CollectionViewModels {
            var bannerViewModels: [HomeBannerCollectionViewCellViewModel]?
            var horizontalProductViewModels: [HomeProductCollectionViewCellViewModel]?
            var verticalProductViewModels: [HomeProductCollectionViewCellViewModel]?
            var couponState: [HomeCouponButtonCollectionViewCellViewModel]?
            var separateLine1ViewModels: [HomeSeparateLineCollectionViewCellViewModel] = [HomeSeparateLineCollectionViewCellViewModel()]
            var separateLine2ViewModels: [HomeSeparateLineCollectionViewCellViewModel] = [HomeSeparateLineCollectionViewCellViewModel()]
            var themeViewModels: (headerViewModel: HomeThemeHeaderCollectionReusableViewModel,
                                  items: [HomeThemeCollectionViewCellViewModel])?
        }
        @Published var collectionViewModels: CollectionViewModels = CollectionViewModels()
    }
    
    // The state property can only be modified within the class, ensuring controlled updates.
    private(set) var state: State = State()
    
    private var loadDataTask: Task<Void, Never>?
    
    // coupon download check key
    private let couponDownloadKey: String = "CouponDownloaded"
    
    // Handles different actions: loading data, processing successful responses into view models, and handling errors.
    func process(action: Action) {
        switch action {
        case .loadData:
            loadData()
        case .loadCoupon:
            loadCoupon()
        case let .getDataSuccess(response):
            transformResponse(response)
        case let .getDataFailure(error):
            print("Network Error: \(error)")
        case let .getCouponSuccess(isDownloaded):
            Task { await transformCoupon(isDownloaded) }
        case .didTapCouponButton:
            downloadCoupon()
        }
    }

    // load data task deinit
    deinit {
        loadDataTask?.cancel()
    }
}


extension HomeViewModel {
    
    // Asynchronously loads data from the API, maps the JSON response to view models for banners and products, and applies them to the collection view snapshot.
    private func loadData() {
        loadDataTask = Task {
            do {
                // get API Success
                let response = try await NetworkService.shared.getHomeData()
                process(action: .getDataSuccess(response))
            } catch {
                process(action: .getDataFailure(error))
            }
        }
    }
    
    // get coupon (success)
    private func loadCoupon() {
        let couponState: Bool = UserDefaults.standard.bool(forKey: couponDownloadKey)
        process(action: .getCouponSuccess(couponState))
    }
    
    private func transformResponse(_ response: HomeResponse){
        Task { await transformBanner(response) }
        Task { await transformHorizontalProduct(response) }
        Task { await transformVerticalProduct(response) }
        Task { await transformTheme(response) }
    }
    
    @MainActor
    private func transformBanner(_ response: HomeResponse) async {
        state.collectionViewModels.bannerViewModels = response.banners.map {
            HomeBannerCollectionViewCellViewModel(bannerImageUrl: $0.imageUrl)
        }
    }
    
    @MainActor
    private func transformHorizontalProduct(_ response: HomeResponse) async {
        state.collectionViewModels.horizontalProductViewModels = productToHomeProductCollectionViewCellViewModel(response.horizontalProducts)
    }
    
    @MainActor
    private func transformVerticalProduct(_ response: HomeResponse) async {
        state.collectionViewModels.verticalProductViewModels = productToHomeProductCollectionViewCellViewModel(response.verticalProducts)
    }
    
    @MainActor
    private func transformTheme(_ response: HomeResponse) async {
        let items = response.themes.map {
            HomeThemeCollectionViewCellViewModel(themeImageUrl: $0.imageUrl)
        }
        state.collectionViewModels.themeViewModels = (HomeThemeHeaderCollectionReusableViewModel(headerText: "Deals for you") , items)
    }
    
    
    // product cell
    private func productToHomeProductCollectionViewCellViewModel(_ product: [Product]) -> [HomeProductCollectionViewCellViewModel] {
        return product.map {
            HomeProductCollectionViewCellViewModel(imageUrlString: $0.imageUrl,
                                                   title: $0.title,
                                                   reasonDiscountString: $0.discount,
                                                   originalPrice: $0.originalPrice.moneyString,
                                                   discountPrice: $0.discountPrice.moneyString)
        }
    }
    
    // coupon success
    @MainActor
    private func transformCoupon(_ isDownloaded: Bool) async {
        state.collectionViewModels.couponState = [.init(state: isDownloaded ? .disable : .enable)]
    }
    
    // download coupon
    private func downloadCoupon() {
        UserDefaults.standard.setValue(true, forKey: couponDownloadKey)
        process(action: .loadCoupon)
    }
}
