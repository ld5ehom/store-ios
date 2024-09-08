//
//  DetailsRateView.swift
//  Store-ios
//
//  Created by TaeWook Park on 9/6/24.
//

import SwiftUI

final class DetailsRateViewModel: ObservableObject {
    init(rate: Int) {
        self.rate = min(max(rate, 0), 5) // Ensure rate is between 0 and 5
    }
    
    @Published var rate: Int
}

struct DetailsRateView: View {
    @ObservedObject var viewModel: DetailsRateViewModel
    
    var body: some View {
        HStack(spacing: 4) {
            // Yellow stars for the given rate
            ForEach(0..<viewModel.rate, id: \.self) { _ in
                starImage
                    .foregroundColor(.yellow)
            }
            // Gray stars for the remaining slots (up to 5)
            ForEach(0..<5 - viewModel.rate, id: \.self) { _ in
                starImage
                    .foregroundStyle(.gray)
            }
        }
    }
    
    var starImage: some View {
        // Xcode star image
        Image(systemName: "star.fill")
            .resizable()
            .frame(width: 16, height: 16)
    }
}

// Ctrl(Command) + Alt + Enter
#Preview {
    DetailsRateView(viewModel: DetailsRateViewModel(rate: 4))
}
