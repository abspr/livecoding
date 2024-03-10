//
//  UsersViewController.swift
//  quandoo
//
//  Created by Hosein Abbaspour on 3/9/24.
//

import UIKit
import Combine

protocol UsersViewControllerDelegate: AnyObject {
    func routeToPosts(by userId: Int)
}

class UsersViewController: UITableViewController {
    
    // MARK: - Types
    typealias DataSource = UsersViewModel.DataSource
    
    //MARK: - Properties
    weak var coordinator: UsersViewControllerDelegate?
    var viewModel: UsersViewModel
    private var subscriptions =  Set<AnyCancellable>()
    private lazy var dataSource: DataSource = initiateDataSource()

    // MARK: Life Cycle
    init(_ viewModel: UsersViewModel = .init()) {
        self.viewModel = viewModel
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        self.viewModel = .init()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupBindings()
    }

    // MARK: Methods
    private func setupViews() {
        title = NSLocalizedString("users title", comment: "User View Controller title")
        tableView.register(
            UserTableViewCell.self,
            forCellReuseIdentifier: UserTableViewCell.identifier
        )
    }
    
    private func setupBindings() {
        viewModel.$snapshot
            .compactMap { $0 }
            .sink { [weak self] snapshot in
                self?.dataSource.apply(snapshot)
            }.store(in: &subscriptions)
    }
    
    private func initiateDataSource() -> DataSource {
        DataSource(tableView: tableView) { tableView, _, item in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier) as? UserTableViewCell else {
                return UITableViewCell()
            }
            
            cell.name = item.name
            cell.usernameView.set(title: item.username, systemImageName: "at")
            cell.emailView.set(title: item.email, systemImageName: "envelope")
            cell.addressView.set(title: item.addressFormatted, systemImageName: "map")
            
            return cell
        }
    }
}

extension UsersViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let user = dataSource.itemIdentifier(for: indexPath) {
            coordinator?.routeToPosts(by: user.id)
        }
    }
    
}
