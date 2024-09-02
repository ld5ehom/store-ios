//
//  HomeBannerCollectionViewCell.swift
//  Store-ios
//
//  Created by TaeWook Park on 9/1/24.
//

import UIKit

struct HomeBannerCollectionViewCellViewModel: Hashable {
    let bannerImage: UIImage
}

// Banner slide
class HomeBannerCollectionViewCell: UICollectionViewCell {
    
    // slide image view 
    @IBOutlet weak var imageView: UIImageView!
    
    
    func setViewModel(_ viewModel: HomeBannerCollectionViewCellViewModel) {
        imageView.image = viewModel.bannerImage
    }
    
}
