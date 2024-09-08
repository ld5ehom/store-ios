//
//  CheckoutSelectedItemView.swift
//  Store-ios
//
//  Created by TaeWook Park on 9/7/24.
//

import UIKit

// checkout item list
struct CheckoutSelectedItemViewModel {
    var title: String
    var description: String
}

final class CheckoutSelectedItemView: UIView {
    private var containerStackView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var contentStackView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    // item title
    private var titleLabel: UILabel = {
        let label:UILabel = UILabel()
        label.font = SFont.UIKit.r14
        label.textColor = SColor.UIKit.blue
        return label
    }()
    
    
    // item description
    private var descriptionLabel: UILabel = {
        let label:UILabel = UILabel()
        label.font = SFont.UIKit.r12
        label.textColor = SColor.UIKit.bk
        return label
    }()
    
    // spacer
    private var spacer: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    var viewModel: CheckoutSelectedItemViewModel
    private var containerStackViewConstraints: [NSLayoutConstraint]?

    init(viewModel: CheckoutSelectedItemViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func updateConstraints() {
        if containerStackViewConstraints == nil {
            let constraints = [
                containerStackView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
                containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
            ]
            NSLayoutConstraint.activate(constraints)
            containerStackViewConstraints = constraints
        }
        super.updateConstraints()
    }
    
    private func commonInit() {
        addSubview(containerStackView)
        containerStackView.addArrangedSubview(contentStackView)
        containerStackView.addArrangedSubview(spacer)
        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(descriptionLabel)
        
        setBorder()
        setViewModel()
    }

    
    // border
    private func setBorder() {
        layer.borderColor = SColor.UIKit.lighterBlue.cgColor
        layer.borderWidth = 1
    }

    private func setViewModel() {
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
    }
}

#Preview {
    CheckoutSelectedItemView(viewModel: CheckoutSelectedItemViewModel(title: "title", description: "Taewook"))
}
