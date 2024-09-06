//
//  PurchaseButton.swift
//  Store-ios
//
//  Created by TaeWook Park on 9/5/24.
//

import UIKit

final class PurchaseButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    // layout
    private func commonInit() {
        layer.cornerRadius = 5
        layer.borderWidth = 1
        layer.borderColor = SColor.gold.cgColor
        setTitleColor(SColor.blue , for: .normal)
        setTitle("Buy Now", for: .normal)
        
    }
}
