//
//  DetailsMoreView.swift
//  Store-ios
//
//  Created by TaeWook Park on 9/7/24.
//

import SwiftUI

// See More button
final class DetailsMoreViewModel: ObservableObject {
}

struct DetailsMoreView: View {
    @ObservedObject var viewModel: DetailsMoreViewModel
    
    // see more button
    var onMoreTapped: () -> Void
    
    var body: some View {
        Button {
            // Action
            onMoreTapped()
        }label: {
            HStack(alignment: .center, spacing: 10, content: {
                Text("See More")
                    .font(SFont.SwiftUI.b17)
                    .foregroundStyle(.uclaBlue)
                Image(systemName: "arrow.down")
                    .foregroundStyle(.uclaBlue)
            })
            .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
            .border(.uclaBlue, width: 1)
        }
    }
}

// Ctrl(Command) + Alt + Enter
#Preview {
    DetailsMoreView(viewModel: DetailsMoreViewModel(), onMoreTapped: {})
}
