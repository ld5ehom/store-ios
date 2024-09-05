//
//  HomeSeparateLineCollectionViewCell.swift
//  Store-ios
//
//  Created by TaeWook Park on 9/4/24.
//

import UIKit

struct HomeSeparateLineCollectionViewCellViewModel: Hashable {
}


// Separate Bar
final class HomeSeparateLineCollectionViewCell: UICollectionViewCell {
    
    static let reusableId: String = "HomeSeparateLineCollectionViewCell"
    
    func setViewModel(_ viewModel: HomeSeparateLineCollectionViewCellViewModel) {
        contentView.backgroundColor = SColor.lightestBlue
    }
}

//layout
extension HomeSeparateLineCollectionViewCell {
    static func separateLineLayout() -> NSCollectionLayoutSection {
        // Define the size for each item
        let itemSize : NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item: NSCollectionLayoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Set the group size
        let groupSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(8))
        let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section: NSCollectionLayoutSection = NSCollectionLayoutSection(group: group)
        
        // scrolling
        section.orthogonalScrollingBehavior = .none
        
        // section margin
        section.contentInsets = .init(top: 1, leading: 0, bottom: 0, trailing: 0)

        return section
    }
}
