//
//  UsersViewController.swift
//  livecoding
//
//  Created by Hosein Abbaspour on 3/9/24.
//

import UIKit
import Combine

protocol UsersViewControllerDelegate: AnyObject {
    func routeToPosts(by userId: Int)
    func routeToLetters(_ letters: [String])
}

class UsersViewController: UICollectionViewController {
    
    // MARK: - Types
    typealias DataSource = UsersViewModel.DataSource
    
    //MARK: - Properties
    var coordinator: UsersViewControllerDelegate?
    var viewModel: UsersViewModel
    private var subscriptions =  Set<AnyCancellable>()
    private lazy var dataSource: DataSource = initiateDataSource()

    // MARK: Life Cycle
    init(_ viewModel: UsersViewModel = .init()) {
        self.viewModel = viewModel
        super.init(collectionViewLayout: .init())
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
        collectionView.collectionViewLayout = createLayout(for: dataSource)
        
        collectionView.register(
            UserViewCell.self,
            forCellWithReuseIdentifier: UserViewCell.identifier
        )
        
        collectionView.register(
            ChipViewCell.self,
            forCellWithReuseIdentifier: ChipViewCell.identifier
        )
    }
    
    private func setupBindings() {
        viewModel.$snapshot
            .compactMap { $0 }
            .sink { [weak self] snapshot in
                self?.dataSource.apply(snapshot)
            }.store(in: &subscriptions)
    }
    
    private func createLayout(for dataSource: DataSource) -> UICollectionViewCompositionalLayout {
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        configuration.interSectionSpacing = 20
        
        return UICollectionViewCompositionalLayout(sectionProvider: { [unowned self] (section, env ) -> NSCollectionLayoutSection? in
            let snapshot = dataSource.snapshot()
            let section = snapshot.sectionIdentifiers[section]
            
            switch section {
            case .chips:
                return buildChipsSection(
                    using: snapshot.itemIdentifiers(inSection: .chips) as? [String]
                )
                
            case .users:
                return buildUsersSectionLayout(env: env)
                
            }
        }, configuration: configuration)
    }
    
    private func buildChipsSection(using usernames: [String]?) -> NSCollectionLayoutSection? {
        guard let usernames else { return nil }
        
        let sizes = usernames.map { username in
            let cell = ChipViewCell()
            cell.title = username
            
            return cell.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        }
        
        let layoutGroup = NSCollectionLayoutGroup.rows(
            sizeCollection: sizes,
            numberOfRows: 2,
            horizontalSpacing: 8,
            verticalSpacing: 10
        )
        
        let section = NSCollectionLayoutSection(group: layoutGroup)
        section.interGroupSpacing = 10
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = .init(top: 10, leading: 20, bottom: 10, trailing: 20)
        
        return section
    }
    
    private func buildUsersSectionLayout(env: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        var configuration = UICollectionLayoutListConfiguration(
            appearance: .insetGrouped
        )
        
        configuration.backgroundColor = .secondarySystemGroupedBackground
        
        let section =  NSCollectionLayoutSection.list(
            using: configuration,
            layoutEnvironment: env
        )
        
        section.contentInsetsReference = .none
        
        return section
    }
    
    private func initiateDataSource() -> DataSource {
        DataSource(collectionView: collectionView) { collectionView, indexPath, item in
            switch item {
            case let username as String:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChipViewCell.identifier, for: indexPath) as? ChipViewCell else {
                    return UICollectionViewCell()
                }
                
                cell.title = username
                
                return cell
                
            case let user as User:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserViewCell.identifier, for: indexPath) as? UserViewCell else {
                    return UICollectionViewCell()
                }
                
                cell.name = user.name
                cell.usernameView.set(title: user.username, systemImageName: "at")
                cell.emailView.set(title: user.email, systemImageName: "envelope")
                cell.addressView.set(title: user.addressFormatted, systemImageName: "map")
                
                return cell
                
            default:
                return UICollectionViewCell()
            }
        }
    }
}
