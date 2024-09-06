//
//  CartViewController.swift
//  Store-ios
//
//  Created by TaeWook Park on 9/5/24.
//
import Combine
import UIKit

final class CartViewController: UIViewController {

    private typealias DataSource = UITableViewDiffableDataSource<Section, AnyHashable>
    private typealias SnapShot = NSDiffableDataSourceSnapshot<Section, AnyHashable>
    
    private enum Section: Int {
        case cart
    }
    
    @IBOutlet private weak var tableView: UITableView!
    
    private lazy var dataSource: DataSource = setDataSource()
    
    private var currentSection: [Section] {
        dataSource.snapshot().sectionIdentifiers as [Section]
    }
    
    private var viewModel: CartViewModel = CartViewModel()
    
    private var cancellables: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewModel()
        viewModel.process(.getCartFromAPI)
    }
    
    private func bindViewModel() {
        viewModel.state.$tableViewModel
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.applySnapShot()
            }.store(in: &cancellables)
    }
    
    
    private func setDataSource() -> DataSource {
        let dataSource: DataSource = UITableViewDiffableDataSource(tableView: tableView) { [weak self] tableView, indexPath, viewModel in
            switch self?.currentSection[indexPath.section] {
            case .cart:
                return self?.cartCell(tableView, indexPath, viewModel)
            case .none:
                return .init()
            }
        }
        return dataSource
    }

    // Cell
    private func cartCell( _ tableView: UITableView, _ indexPath: IndexPath, _ viewModel: AnyHashable) -> UITableViewCell? {
        
        guard let viewModel = viewModel as? CartItemTableViewCellViewModel,
              let cell = tableView.dequeueReusableCell(withIdentifier: CartItemTableViewCell.reusableId, for: indexPath) as? CartItemTableViewCell else {
            return nil
        }
        cell.setViewModel(viewModel)
        return cell
        
    }
    
    //SnapShot
    private func applySnapShot() {
        var snapShot: SnapShot = SnapShot()
        
        if let cart = viewModel.state.tableViewModel {
            snapShot.appendSections([.cart])
            snapShot.appendItems(cart, toSection: .cart)
        }
        dataSource.apply(snapShot)
    }
    
}
