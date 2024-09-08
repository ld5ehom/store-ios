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
    private var rootView: CheckoutRootView = CheckoutRootView()
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        bindViewModel()
        viewModel.process(.loadData)
    }
    

    
    private func bindViewModel() {
        viewModel.$state
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let viewModels = self?.viewModel.state.checkoutItems else { return }
                self?.rootView.setCheckoutItem(viewModels)
            }
            // Store the cancellable in the set to manage the lifecycle of the subscription
            .store(in: &cancellables)
        
        // payment view controller - WKWebView
        viewModel.showPaymentViewController
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                let paymentViewController: PaymentViewController = PaymentViewController()
                self?.navigationController?.pushViewController(paymentViewController, animated: true)
            }
            .store(in: &cancellables)
        
    }
}

// ctrl(command) + alt + enter  = preview on/off
#Preview {
    CheckoutViewController()
}
