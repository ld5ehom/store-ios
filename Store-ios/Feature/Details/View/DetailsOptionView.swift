//
//  DetailsOptionView.swift
//  Store-ios
//
//  Created by TaeWook Park on 9/6/24.
//

import SwiftUI
import Kingfisher

// Product Option

final class DetailsOptionViewModel: ObservableObject {
    
    init(type: String, name: String, imageUrl: String) {
        self.type = type
        self.name = name
        self.imageUrl = imageUrl
    }
    @Published var type: String
    @Published var name: String
    @Published var imageUrl: String
}

struct DetailsOptionView: View {
    @ObservedObject var viewModel: DetailsOptionViewModel
    
    var body: some View {
        HStack(spacing: 0, content: {
            VStack(alignment: .leading, spacing: 4, content: {
                Text(viewModel.type)
                    .foregroundStyle(.bk)
                    .font(SFont.SwiftUI.r14)
                Text(viewModel.name)
                    .foregroundStyle(.uclaBlue)
                    .font(SFont.SwiftUI.b16)
            })
            Spacer()
            KFImage(URL(string: viewModel.imageUrl))
                .resizable()
                .frame(width: 50, height: 50)
        })
    }
}

#Preview {
    DetailsOptionView(viewModel: DetailsOptionViewModel(type: "Color",
                                                        name: "UCLABlue",
                                                        imageUrl: "https://raw.githubusercontent.com/ld5ehom/data/main/UCLABlue.png"))
}
