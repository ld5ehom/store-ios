//
//  Product.swift
//  Store-ios
//
//  Created by TaeWook Park on 9/5/24.
//

import Foundation


struct Product: Decodable {
    let id: Int
    let imageUrl: String
    let title: String
    let discount: String
    let originalPrice: Int
    let discountPrice: Int
}
