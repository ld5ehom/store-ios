//
//  CartItemTableViewCell.swift
//  Store-ios
//
//  Created by TaeWook Park on 9/5/24.
//

import UIKit
import Kingfisher

struct CartItemTableViewCellViewModel: Hashable {
    let imageUrl: String
    let productName: String
    var productPrice: String
}

final class CartItemTableViewCell: UITableViewCell {

    static let reusableId: String = "CartItemTableViewCell"

    // image
    @IBOutlet weak var productItemImageView: UIImageView!
    
    // Title
    @IBOutlet weak var productTitleLabel: UILabel!
    
    // price
    @IBOutlet weak var productPriceLabel: UILabel!
    
    // button layout
    @IBOutlet weak var productPurchaseButton: PurchaseButton!
    
    func setViewModel(_ viewModel: CartItemTableViewCellViewModel) {
        
        // image URL
        productItemImageView.kf.setImage(with: URL(string: viewModel.imageUrl))
        
        // title
        productTitleLabel.text = viewModel.productName
        
        // price
        productPriceLabel.text = viewModel.productPrice
        
    }
    
}
