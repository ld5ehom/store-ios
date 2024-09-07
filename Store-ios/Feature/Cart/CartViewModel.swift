//
//  CartViewModel.swift
//  Store-ios
//
//  Created by TaeWook Park on 9/5/24.
//

import Foundation

final class CartViewModel {
    
    // Cart API
    enum Action {
        case getCartFromAPI
        case getCartSuccess(CartResponse)
        case getCartFailure(Error)
        case didTapPurchaseButton
    }
    
    // Cart Status
    final class State {
        @Published var tableViewModel: [CartItemTableViewCellViewModel]?
    }
    
    private(set) var state: State = State()
    
    // cancel load data
    private var loadDataTask: Task<Void, Never>?
    
    // Action
    func process(_ action: Action) {
        switch action {
        case .getCartFromAPI:
            getCartFromAPI()
        case .getCartSuccess(let CartResponse):
//            print(CartResponse)
            translateCartItemViewModel(CartResponse)
        case .getCartFailure(let error):
            print(error)
        case .didTapPurchaseButton:
            break
        }
    }
    
    deinit {
        loadDataTask?.cancel()
    }
    
}


extension CartViewModel {
    
    // API
    private func getCartFromAPI() {
        loadDataTask = Task {
            do {
                let response = try await NetworkService.shared.getCartData()
                process(.getCartSuccess(response))
            } catch {
                process(.getCartFailure(error))
            }
        }
    }
    
    // Success
    private func translateCartItemViewModel(_ response: CartResponse) {
        state.tableViewModel = response.carts.map {
            CartItemTableViewCellViewModel(imageUrl: $0.imageUrl,
                                           productName: $0.title,
                                           productPrice: $0.discountPrice.moneyString)
        }
    }
    
}

