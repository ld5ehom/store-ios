//
//  HomeCouponButtonCollectionViewCell.swift
//  Store-ios
//
//  Created by TaeWook Park on 9/3/24.
//
import Combine
import UIKit

struct HomeCouponButtonCollectionViewCellViewModel: Hashable {
    enum CouponState {
        case enable
        case disable
    }
    var state: CouponState
}

final class HomeCouponButtonCollectionViewCell: UICollectionViewCell {
    
    static let reusableId: String = "HomeCouponButtonCollectionViewCell"
    
    // coupon button key
    private weak var didTapCouponButton: PassthroughSubject<Void, Never>?
    
    // Home Button Image View
    @IBOutlet weak var couponButton: UIButton! {
        didSet {
            couponButton.setImage(SImage.buttonActivate, for: .normal)
            couponButton.setImage(SImage.buttonComplete, for: .disabled)
        }
    }
    
    func setViewModel(_ viewModel: HomeCouponButtonCollectionViewCellViewModel, _ didTapCouponButton: PassthroughSubject<Void, Never>?) {
        self.didTapCouponButton = didTapCouponButton
        couponButton.isEnabled = switch viewModel.state {
        case .enable:
            true
        case .disable:
            false
        }
    }
    
    // tap 
    @IBAction private func didTapCouponButton(_ sender: Any) {
        didTapCouponButton?.send()
    }
}

// button layout
extension HomeCouponButtonCollectionViewCell {
    static func couponButtonItemLayout() -> NSCollectionLayoutSection {
        
        // Define the size for each item
        let itemSize : NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item: NSCollectionLayoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Set the group size
        let groupSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(37))
        let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section: NSCollectionLayoutSection = NSCollectionLayoutSection(group: group)
        
        // Disable scrolling if not needed
        section.orthogonalScrollingBehavior = .none
        
        // Set content insets to 0 to avoid cutting off the sides
        section.contentInsets = .init(top: 20, leading: 1, bottom: 0, trailing: 1)

        return section
    }
}
