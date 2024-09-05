//
//  HomeThemeHeaderCollectionReusableView.swift
//  Store-ios
//
//  Created by TaeWook Park on 9/5/24.
//

import UIKit

struct HomeThemeHeaderCollectionReusableViewModel {
    var headerText: String
}

// Deals for you - event title
final class HomeThemeHeaderCollectionReusableView: UICollectionReusableView {
    static let reusableId: String = "HomeThemeHeaderCollectionReusableView"
    
    // header title variable
    @IBOutlet weak var themeHeaderLabel: UILabel!
    
    func setViewModel(_ viewModel: HomeThemeHeaderCollectionReusableViewModel) {
        themeHeaderLabel.text = viewModel.headerText
    }
}
