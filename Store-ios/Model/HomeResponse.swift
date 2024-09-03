//
//  HomeResponse.swift
//  Store-ios
//
//  Created by TaeWook Park on 9/2/24.
//

import Foundation

// Models the JSON response for the Home screen data
struct HomeResponse: Decodable {
    let banners: [Banner]
    let horizontalProducts: [Product]
    let verticalProducts: [Product]
    let themes: [Banner]
}

struct Banner: Decodable {
    let id: Int
    let imageUrl: String
}


struct Product: Decodable {
    let id: Int
    let imageUrl: String
    let title: String
    let discount: String
    let originalPrice: Int
    let discountPrice: Int
}

