//
//  DetailsViewController.swift
//  Store-ios
//
//  Created by TaeWook Park on 9/7/24.
//

import UIKit
import SwiftUI

final class DetailsViewController: UIViewController {

    let viewModel: DetailsViewModel = DetailsViewModel()
    
    lazy var rootView: UIHostingController = UIHostingController(rootView: DetailsRootView(viewModel: viewModel))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addRootView()
    }
    
    private func addRootView() {
        addChild(rootView)
        view.addSubview(rootView.view)
        
        rootView.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rootView.view.topAnchor.constraint(equalTo: view.topAnchor),
            rootView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            rootView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            rootView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
