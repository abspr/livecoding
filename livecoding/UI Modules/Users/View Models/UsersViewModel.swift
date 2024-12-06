//
//  UsersViewModel.swift
//  livecoding
//
//  Created by Hosein Abbaspour on 3/9/24.
//

import UIKit

class UsersViewModel {
    
    // MARK: - Types
    typealias DataSourceSnapshot = NSDiffableDataSourceSnapshot<Section, User>
    typealias DataSource = UITableViewDiffableDataSource<Section, User>
    
    enum Section {
        case users
    }
    
    // MARK: - Properties
    @Published var snapshot: DataSourceSnapshot?
    private var service: UserService
    
    // MARK: - Life Cycle
    init(_ servie: UserService = .init()) {
        self.service = servie
        fetchUsers()
    }
    
    // MARK: - Methods
    private func fetchUsers() {
        service.users { [weak self] result in
            switch result {
            case .success(let users):
                self?.updateSnapshot(using: users)
                
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
    
    private func updateSnapshot(using users: [User]) {
        var snapshot = DataSourceSnapshot()
        snapshot.appendSections([.users])
        snapshot.appendItems(users)
        self.snapshot = snapshot
    }
    
}
