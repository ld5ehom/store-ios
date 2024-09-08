//
//  CheckoutViewModel.swift
//  Store-ios
//
//  Created by TaeWook Park on 9/7/24.
//

import Combine
import Foundation

final class CheckoutViewModel: ObservableObject {
    enum Action {
        case loadData
        case didTapCheckoutButton
    }
    
    struct State {
        var checkoutItems: [CheckoutSelectedItemViewModel]?
    }
    
    @Published private(set) var state: State = State()
    
    func process(_ action: Action) {
        switch action {
        case .loadData:
            Task { await loadData() }
        case .didTapCheckoutButton:
            Task { await didTapCheckoutButton() }
        }
    }
}

extension CheckoutViewModel {
    
    @MainActor
    private func loadData() async {
        // example (+ 2 second)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.state.checkoutItems = [
                CheckoutSelectedItemViewModel(title: "UCLA T-Shirts1", description: "Free Shipping"),
                CheckoutSelectedItemViewModel(title: "UCLA T-Shirts2", description: "Free Shipping"),
                CheckoutSelectedItemViewModel(title: "UCLA T-Shirts3", description: "Free Shipping"),
                CheckoutSelectedItemViewModel(title: "UCLA T-Shirts4", description: "Free Shipping"),
                CheckoutSelectedItemViewModel(title: "UCLA T-Shirts5", description: "Free Shipping"),
                CheckoutSelectedItemViewModel(title: "UCLA T-Shirts6", description: "Free Shipping"),
                CheckoutSelectedItemViewModel(title: "UCLA T-Shirts7", description: "Free Shipping")
            ]
        }
    }
    
    @MainActor
    private func didTapCheckoutButton() async {
        // purchase (checkout button)
    }
}
