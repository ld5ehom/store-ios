//
//  HomeThemeCollectionViewCell.swift
//  Store-ios
//
//  Created by TaeWook Park on 9/5/24.
//
import Kingfisher
import UIKit

struct HomeThemeCollectionViewCellViewModel: Hashable {
    let themeImageUrl: String
}

// UICollectionViewCell subclass for displaying a theme
final class HomeThemeCollectionViewCell: UICollectionViewCell {
    static let reusableId: String = "HomeThemeCollectionViewCell"
    
    
    @IBOutlet private weak var themeImageView: UIImageView!
    
    func setViewModel(_ viewModel: HomeThemeCollectionViewCellViewModel) {
        // Use Kingfisher to set the image from the URL
        themeImageView.kf.setImage(with: URL(string: viewModel.themeImageUrl))
    }
}

// layout
extension HomeThemeCollectionViewCell {
    static func themeLayout() -> NSCollectionLayoutSection {
        
        // item size
        let itemSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item: NSCollectionLayoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // group size
        let groupFractionalWidth: CGFloat = 0.7
        let groupSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(groupFractionalWidth), heightDimension: .fractionalHeight(groupFractionalWidth * (1/5)))
        let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // section
        let section: NSCollectionLayoutSection = NSCollectionLayoutSection(group: group)
        
        // section center align
        section.orthogonalScrollingBehavior = .groupPagingCentered
        
        // section margin
        section.interGroupSpacing = 16
        
        section.contentInsets = .init(top: 10, leading: 0, bottom: 0, trailing: 0)
        
        // theme title - Deals for you
        let headerSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(40))
        let header: NSCollectionLayoutBoundarySupplementaryItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        section.boundarySupplementaryItems = [header]
        return section
    }
}

