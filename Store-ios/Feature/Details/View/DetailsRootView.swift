//
//  DetailsRootView.swift
//  Store-ios
//
//  Created by TaeWook Park on 9/6/24.
//

import SwiftUI
import Kingfisher

struct DetailsRootView: View {
    @ObservedObject var viewModel: DetailsViewModel
    
    var body: some View {
        
        VStack(spacing: 0) {
            ScrollView(.vertical) {
                VStack(spacing: 0, content: {
                    bannerView
                    rateView
                    titleView
                    optionView
                    priceView
                    mainImageView
                })
            }
            // see more
            moreView
            
            // add cart and purchase
            purchaseView
        }
        .onAppear(perform: {
            viewModel.process(.loadData)
        })
        
    }
    
    @ViewBuilder
    var bannerView: some View {
        // banner carousel
        if let bannersViewModel = viewModel.state.banners {
            DetailsBannerView(viewModel: bannersViewModel)
                .padding(.bottom, 15)
        }
    }
    
    @ViewBuilder
    var rateView: some View {
        // discount rate
        if let rateViewModel = viewModel.state.rate {
            HStack(spacing: 0, content: {
                Spacer()
                DetailsRateView(viewModel: rateViewModel)
            })
            .padding(.horizontal, 20)
        }
    }
    
    @ViewBuilder
    var titleView: some View {
        // product title
        if let titleViewModel = viewModel.state.title {
            HStack(spacing: 0, content: {
                Text(titleViewModel)
                    .font(SFont.SwiftUI.m17)
                    .foregroundStyle(.black)
                Spacer()
            })
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
            
        }
    }
    
    @ViewBuilder
    var optionView: some View {
        // product option details
        if let optionViewModel = viewModel.state.option {
            Group {
                DetailsOptionView(viewModel: optionViewModel)
                    .padding(.bottom, 30)
                HStack(spacing: 0) {
                    Spacer()
                    Button(action: {
                        viewModel.process(.didTapChangeOption)
                    }, label: {
                        Text("Options")
                            .font(SFont.SwiftUI.m12)
                            .foregroundStyle(.black)
                    })
                }
            }
            // Group padding
            .padding(.horizontal, 20)
        }
    }
    
    @ViewBuilder
    var priceView: some View {
        // product price
        if let priceViewModel = viewModel.state.price {
            HStack(spacing: 0) {
                DetailsPriceView(viewModel: priceViewModel)
                Spacer()
            }
            .padding(.bottom, 30)
            .padding(.horizontal, 20)
        }
    }
    
    @ViewBuilder
    var mainImageView: some View {
        // image list
        if let mainImageViewModel = viewModel.state.mainImageUrls {
            LazyVStack(spacing: 0) {
                ForEach(mainImageViewModel, id: \.self) {
                    KFImage.url(URL(string: $0))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
            }
            .padding(.bottom, 30)
            .frame(maxHeight: viewModel.state.more == nil ? .infinity : 200, alignment: .top)
            .clipped()
        }
    }
    
    @ViewBuilder
    var moreView: some View {
        if let moreViewModel = viewModel.state.more {
            DetailsMoreView(viewModel: moreViewModel) {
                viewModel.process(.didTapMore) // See More
            }
        }
    }
    
    @ViewBuilder
    var purchaseView: some View {
        if let purchaseViewModel = viewModel.state.purchase {
            DetailsPurchaseView(viewModel: purchaseViewModel) {
                viewModel.process(.didTapCart)
            } onPurchaseTapped: {
                viewModel.process(.didTapPurchase)
            }
        }
    }
}

// Ctrl(Command) + Alt + Enter
#Preview {
    DetailsRootView(viewModel: DetailsViewModel())
}
