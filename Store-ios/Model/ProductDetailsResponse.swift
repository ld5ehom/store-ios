//
//  ProductDetailsResponse.swift
//  Store-ios
//
//  Created by TaeWook Park on 9/6/24.
//

import Foundation

struct ProductDetailsResponse: Decodable {
    var bannerImages: [String]
    var product: ProductDetails
    var option: ProductDetailsOption
    var detailImages: [String]
}

struct ProductDetails: Decodable {
    var name: String
    var discountPercent: Int
    var originalPrice: Int
    var discountPrice: Int
    var rate: Int
}

struct ProductDetailsOption: Decodable {
    var type: String
    var name: String
    var image: String
}

