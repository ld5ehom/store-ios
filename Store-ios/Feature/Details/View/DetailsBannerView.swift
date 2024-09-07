//
//  DetailsBannerView.swift
//  Store-ios
//
//  Created by TaeWook Park on 9/6/24.
//

import SwiftUI
import Kingfisher

final class DetailsBannerViewModel: ObservableObject {
    init(imageUrls: [String]) {
        self.imageUrls = imageUrls
    }
    
    @Published var imageUrls: [String]
}

struct DetailsBannerView: View {
    
    @ObservedObject var viewModel: DetailsBannerViewModel
    
    // banner carousel 
    var body: some View {
        
        // Horizontal Scroll View
        ScrollView(.horizontal) {
            LazyHStack(spacing: 0, content: {
                ForEach(viewModel.imageUrls, id: \.self) { imageUrl in
                    // kingfisher image url
                    KFImage(URL(string: imageUrl))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                }
            })
        }
        // frame size
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
        
        // paging
        .scrollTargetBehavior(.paging)
        
        // scroll bar
        .scrollIndicators(.never)
    }
}

// Ctrl(Command) + Alt + Enter
#Preview {
    DetailsBannerView(viewModel: DetailsBannerViewModel(imageUrls: [
        "https://raw.githubusercontent.com/ld5ehom/data/main/item0.jpg",
        "https://raw.githubusercontent.com/ld5ehom/data/main/item1.jpg",
        "https://raw.githubusercontent.com/ld5ehom/data/main/item2.jpg",
        "https://raw.githubusercontent.com/ld5ehom/data/main/item3.jpg"]))
}

