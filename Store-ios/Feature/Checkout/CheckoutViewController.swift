//
//  CheckoutViewController.swift
//  Store-ios
//
//  Created by TaeWook Park on 9/7/24.
//
import Combine
import UIKit

final class CheckoutViewController: UIViewController {
    private var cancellables: Set<AnyCancellable> = []
    private var viewModel: CheckoutViewModel = CheckoutViewModel()
    private var scrollViewConstraints: [NSLayoutConstraint]?
    private var titleLabelConstraints: [NSLayoutConstraint]?
    private var checkoutItemStackConstraints: [NSLayoutConstraint]?
    private var checkoutButtonConstraints: [NSLayoutConstraint]?
    
    private var scrollView: UIScrollView = {
        let scrollView: UIScrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private var containerView: UIView = {
        let view: UIView = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // title label
    private var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Shopping Cart"
        label.font = SFont.UIKit.m17
        label.textColor = SColor.UIKit.bk
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // item stack
    private var checkoutItemStackView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 7
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    // Proceed to Checkout button
    private var checkoutButton: UIButton = {
        let button: UIButton = UIButton()
        button.setTitle("Proceed to Checkout", for: .normal)
        button.setTitleColor(SColor.UIKit.gold, for: .normal)
        button.titleLabel?.font = SFont.UIKit.m17
        button.layer.backgroundColor = SColor.UIKit.blue.cgColor
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubViews()
        bindViewModel()
        viewModel.process(.loadData)
    }
    
    override func updateViewConstraints() {
        
        if scrollViewConstraints == nil {
            let constraints = [
                // scroll view constraint
                scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                
                // container view constraint
                containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
            ]
            
            NSLayoutConstraint.activate(constraints)
            scrollViewConstraints = (constraints)
        }
        
        // title layout
        if titleLabelConstraints == nil, let superView = titleLabel.superview {
            let constraints = [
                titleLabel.topAnchor.constraint(equalTo: superView.topAnchor, constant: 33),
                titleLabel.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: 33),
                titleLabel.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -33)
            ]
            NSLayoutConstraint.activate(constraints)
            titleLabelConstraints = constraints
        }
        
        // checkout item view 
        if checkoutItemStackConstraints == nil, let superView = checkoutItemStackView.superview {
            let constraints = [
                checkoutItemStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
                checkoutItemStackView.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: 20),
                checkoutItemStackView.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -20),
                checkoutItemStackView.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -33)
            ]
            NSLayoutConstraint.activate(constraints)
            checkoutItemStackConstraints = constraints
        }
        
        // buy button
        if checkoutButtonConstraints == nil, let superView = checkoutButton.superview {
            let constraints = [
                checkoutButton.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: 20),
                checkoutButton.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -20),
                checkoutButton.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -40),
                checkoutButton.heightAnchor.constraint(equalToConstant: 50)
            ]
            NSLayoutConstraint.activate(constraints)
            checkoutButtonConstraints = constraints
        }
        
        
        super.updateViewConstraints()
    }
    
    private func addSubViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(checkoutItemStackView)
        view.addSubview(checkoutButton)
    }
    
    private func bindViewModel() {
        viewModel.$state
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                
                // When the state is updated, clear all arranged subviews from the `checkoutItemStackView`
                self?.checkoutItemStackView.arrangedSubviews.forEach {
                    $0.removeFromSuperview()
                }
                
                // Add new arranged subviews based on the updated state
                self?.viewModel.state.checkoutItems?.forEach {
                    self?.checkoutItemStackView.addArrangedSubview(CheckoutSelectedItemView(viewModel: $0))
                }
            }
            // Store the cancellable in the set to manage the lifecycle of the subscription
            .store(in: &cancellables)
        
    }
}

// ctrl(command) + alt + enter  = preview on/off
#Preview {
    CheckoutViewController()
}
