//
//  DetailsViewModel.swift
//  Store-ios
//
//  Created by TaeWook Park on 9/6/24.
//

import Foundation
import Combine

final class DetailsViewModel: ObservableObject {
    struct State {
        var isError: String?
        
        // loading
        var isLoading: Bool = false
        
        // banner carousel 
        var banners: DetailsBannerViewModel?
        
        // discount rate
        var rate: DetailsRateViewModel?
        
        var title: String?
        var option: DetailsOptionViewModel?
        var price: DetailsPriceViewModel?
        var mainImageUrls: [String]?
        var more: DetailsMoreViewModel?
        var purchase: DetailsPurchaseViewModel?
    }
    
    enum Action {
        case loadData
        case loading(Bool)
        case getDataSuccess(ProductDetailsResponse)
        case getDataFailure(Error)
        case didTapChangeOption
        case didTapMore
        case didTapCart
        case didTapPurchase
    }
    
    @Published private(set) var state: State = State()
    
    // Option View controller
    private(set) var showOptionViewController: PassthroughSubject<Void, Never> = PassthroughSubject<Void, Never>()
    
    // cancel load data
    private var loadDataTask: Task<Void, Never>?
    
    // cart
    private var isCart: Bool = false
    
    private var needShowMore: Bool = true
    
    func process(_ action: Action) {
        switch action {
        case .loadData:
            loadData()
        case let .getDataSuccess(response):
            Task { await transformProductDetailsResponse(response)}
        case let .getDataFailure(error):
            Task { await getDataFailure(error) }
        case let .loading(isLoading):
            Task { await toggleLoading(isLoading) }
        case .didTapChangeOption:
            showOptionViewController.send()
        case .didTapMore:
            Task { await toggleMore() }
        case .didTapCart:
            Task { await toggleCart() }
        case .didTapPurchase:
            break
        }
    }
    
    deinit {
        loadDataTask?.cancel()
    }
}

extension DetailsViewModel {
    
    private func loadData() {
        loadDataTask = Task {
            defer {
                process(.loading(false))
            }
            do {
                process(.loading(true))
                let response = try await NetworkService.shared.getProductDetailsData()
                process(.getDataSuccess(response))
            } catch {
                process(.getDataFailure(error))
            }
        }
    }
    
    /**
     Publishing changes from background threads is not allowed; make sure to publish values from the main thread (via operators like receive(on:)) on model updates.
     -> Main thread error : Separating `toggleLoading','toggleCart' as a MainActor to asynchronously update the UI state.
     */
    @MainActor
    private func toggleLoading(_ isLoading: Bool) async {
        state.isLoading = isLoading
    }
    
    @MainActor
    private func toggleCart() async {
        isCart.toggle()
        state.purchase = DetailsPurchaseViewModel(isCart: isCart)
    }
    
    @MainActor
    private func toggleMore() async {
        needShowMore = false
        state.more = needShowMore ? DetailsMoreViewModel() : nil
    }
    
    
    @MainActor
    private func transformProductDetailsResponse(_ response: ProductDetailsResponse) async {
        state.isError = nil
        state.banners = DetailsBannerViewModel(imageUrls: response.bannerImages)
        state.rate = DetailsRateViewModel(rate: response.product.rate)
        state.title = response.product.name
        state.option = DetailsOptionViewModel(type: response.option.type,
                                              name: response.option.name,
                                              imageUrl: response.option.image)
        state.price = DetailsPriceViewModel(discountRate: "\(response.product.discountPercent)%",
                                            originalPrice: response.product.originalPrice.moneyString,
                                            currentPrice: response.product.discountPrice.moneyString,
                                            shippingType: "Free Shipping!")
        state.mainImageUrls = response.detailImages
        state.more = needShowMore ? DetailsMoreViewModel() : nil
        state.purchase = DetailsPurchaseViewModel(isCart: isCart)
    }
    
    @MainActor
    private func getDataFailure(_ error: Error) {
        state.isError = "Error. \(error.localizedDescription)"
    }
    
}
