//
//  HomeProductCollectionViewCell.swift
//  Store-ios
//
//  Created by TaeWook Park on 9/2/24.
//

import UIKit

// Home Product ViewModel
struct HomeProductCollectionViewCellViewModel: Hashable {
    let imageUrlString: String
    let title: String
    let reasonDiscountString: String
    let originalPrice: String
    let discountPrice: String
}
    
class HomeProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productItemImageView: UIImageView!{
        didSet {
            productItemImageView.layer.cornerRadius = 5
        }
    }
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productReasonDiscountLabel: UILabel!
    @IBOutlet weak var originalPriceLabel: UILabel!
    @IBOutlet weak var discountPriceLabel: UILabel!
    
    func setViewModel(_ viewModel: HomeProductCollectionViewCellViewModel) {
        // Product url
//        productItemImageView.image =
        
        productTitleLabel.text = viewModel.title
        productReasonDiscountLabel.text = viewModel.reasonDiscountString
        
        //strike-through
        originalPriceLabel.attributedText = NSMutableAttributedString(string: viewModel.originalPrice,
                                                                      attributes: [NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue])

        discountPriceLabel.text = viewModel.discountPrice
        
        
    }
}

// Extension for defining different layout configurations for HomeProductCollectionViewCell
extension HomeProductCollectionViewCell {
    
    static func horizontalProductItemLayout() -> NSCollectionLayoutSection {
        
        // Define the size for each item in the collection view
        let itemSize : NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item: NSCollectionLayoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Set the group size with a fixed width of 117 and an estimated height of 224
        let groupSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .absolute(117), heightDimension: .estimated(224))
        let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // Create a section with the group, enabling carousel-like scrolling behavior
        let section: NSCollectionLayoutSection = NSCollectionLayoutSection(group: group)
        
        // Enable carousel-like scrolling for the banner section
        section.orthogonalScrollingBehavior = .continuous
        
        // section margin
        section.contentInsets = .init(top: 20, leading: 33, bottom: 0, trailing: 33)
        
        // Return the compositional layout for the collection view
        return section
    }
    
    static func verticalProductItemLayout() -> NSCollectionLayoutSection {
        
        // Define the size for each item in the collection view
        let itemSize : NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .estimated(277))
        let item: NSCollectionLayoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Set the group size with a fixed width of 117 and an estimated height of 224
        let groupSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(277))
        let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // Create a section with the group, enabling carousel-like scrolling behavior
        let section: NSCollectionLayoutSection = NSCollectionLayoutSection(group: group)
        
        // Enable scrolling for the goods section
        section.orthogonalScrollingBehavior = .none
        
        // section margin
        section.contentInsets = .init(top: 20, leading: 19, bottom: 0, trailing: 19)
        
        // Return the compositional layout for the collection view
        return section
    }
}
