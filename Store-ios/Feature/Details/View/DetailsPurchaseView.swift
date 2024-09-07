//
//  DetailsPurchaseView.swift
//  Store-ios
//
//  Created by TaeWook Park on 9/7/24.
//

import SwiftUI

// Add cart and purchase button
final class DetailsPurchaseViewModel: ObservableObject {
    
    init(isCart: Bool) {
        self.isCart = isCart
    }
    
    @Published var isCart: Bool
}

struct DetailsPurchaseView: View {
    @ObservedObject var viewModel: DetailsPurchaseViewModel
    
    var onCartTapped: () -> Void
    var onPurchaseTapped: () -> Void
    
    var body: some View {
        HStack(spacing: 30, content: {
            Button(action: onCartTapped, label: {
                viewModel.isCart ? Image(systemName: "cart.badge.plus") : Image(systemName: "cart.fill.badge.minus")
            })
            .font(.system(size: 40)) // Adjust cart image size
            
            Button(action: onPurchaseTapped, label: {
                Text("Buy Now")
                    .font(SFont.SwiftUI.m20)
                    .foregroundStyle(.uclaGold)
            })
            .frame(maxWidth: .infinity, minHeight: 45, maxHeight: 45)
            .background(.uclaBlue)
            .clipShape(RoundedRectangle(cornerRadius: 5))
        })
        .padding(.top, 15)
        .padding(.horizontal, 25)
    }
}

// Ctrl(Command) + Alt + Enter
#Preview {
    DetailsPurchaseView(viewModel: DetailsPurchaseViewModel(isCart: true),
    onCartTapped: {}, onPurchaseTapped: {})
}
