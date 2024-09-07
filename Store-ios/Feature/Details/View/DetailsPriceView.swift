//
//  DetailsPriceView.swift
//  Store-ios
//
//  Created by TaeWook Park on 9/6/24.
//

import SwiftUI

final class DetailsPriceViewModel: ObservableObject {
    init(discountRate: String, originalPrice: String, currentPrice: String, shippingType: String) {
        self.discountRate = discountRate
        self.originalPrice = originalPrice
        self.currentPrice = currentPrice
        self.shippingType = shippingType
    }
    var discountRate: String
    var originalPrice: String
    var currentPrice: String
    var shippingType: String
}

struct DetailsPriceView: View {
    
    @ObservedObject var viewModel: DetailsPriceViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 21, content: {
            VStack(alignment: .leading,spacing: 6, content: {
                HStack(spacing: 5, content: {
                    Text(viewModel.discountRate)
                        .font(SFont.SwiftUI.b14)
                        .foregroundStyle(.uclaDarkestBlue)
                    Text(viewModel.originalPrice)
                        .font(SFont.SwiftUI.b16)
                        .strikethrough()
                        .foregroundStyle(.uclaLighterBlue)
                })
                Text(viewModel.currentPrice)
                    .font(SFont.SwiftUI.b20)
                    .foregroundStyle(.red)
            })
            Text(viewModel.shippingType)
                .font(SFont.SwiftUI.r14)
                .foregroundStyle(.uclaDarkestBlue)
        })
    }
}

#Preview {
    DetailsPriceView(viewModel: DetailsPriceViewModel(discountRate: "50%",
                                                      originalPrice: "15,000.00",
                                                      currentPrice: "7,500.00",
                                                      shippingType: "Free Shipping!"))
}
