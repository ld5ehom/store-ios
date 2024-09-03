//
//  HomeBannerCollectionViewCell.swift
//  Store-ios
//
//  Created by TaeWook Park on 9/1/24.
//

import UIKit

struct HomeBannerCollectionViewCellViewModel: Hashable {
    let bannerImageUrl: String
}

// Banner slide
class HomeBannerCollectionViewCell: UICollectionViewCell {
    
    // slide image view 
    @IBOutlet weak var imageView: UIImageView!
    
    
    func setViewModel(_ viewModel: HomeBannerCollectionViewCellViewModel) {
//        imageView.image = viewModel.bannerImage
    }
    
}


extension HomeBannerCollectionViewCell {
    static func bannerLayout() -> NSCollectionLayoutSection {
        
        // Define the size for each item in the collection view
        let itemSize : NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item: NSCollectionLayoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Define the size and layout for each group, with a fixed aspect ratio for the banners
        let groupSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(165 / 393))
        let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // Create a section with the group, enabling carousel-like scrolling behavior
        let section: NSCollectionLayoutSection = NSCollectionLayoutSection(group: group)
        
        // Enable carousel-like scrolling for the banner section
        section.orthogonalScrollingBehavior = .groupPaging
        
        // Return the compositional layout for the collection view
        return section
    }
}
