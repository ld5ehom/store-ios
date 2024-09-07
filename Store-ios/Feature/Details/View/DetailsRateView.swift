//
//  DetailsRateView.swift
//  Store-ios
//
//  Created by TaeWook Park on 9/6/24.
//

import SwiftUI

final class DetailsRateViewModel: ObservableObject {
    init(rate: Int) {
        self.rate = rate
    }
    
    @Published var rate: Int
}

struct DetailsRateView: View {
    @ObservedObject var viewModel: DetailsRateViewModel
    
    var body: some View {
        HStack(spacing: 4, content:  {
            ForEach(0..<viewModel.rate, id: \.self) { _ in
                starImage
                    .foregroundColor(.yellow)
            }
            ForEach(0..<5 - viewModel.rate, id: \.self) { _ in
                starImage
                    .foregroundStyle(.gray)
            }
        })
    }
    
    var starImage: some View {
        // xcode star image
        Image(systemName: "star.fill")
            .resizable()
            .frame(width: 16, height: 16)
    }
}

// Ctrl(Command) + Alt + Enter
#Preview {
    DetailsRateView(viewModel: DetailsRateViewModel(rate: 4))
}
