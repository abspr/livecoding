//
//  LettersViewController.swift
//  livecoding
//
//  Created by Hosein Abbaspour on 12/5/24.
//

import UIKit
import Combine

class LettersViewController: UICollectionViewController {
    
    // MARK: - Types
    typealias DataSource = LettersViewModel.DataSource
    
    //MARK: - Properties
    var viewModel: LettersViewModel
    private var subscriptions =  Set<AnyCancellable>()
    private lazy var dataSource: DataSource = initiateDataSource()
    
    // MARK: Life Cycle
    init(_ viewModel: LettersViewModel) {
        self.viewModel = viewModel
        super.init(collectionViewLayout: .init())
    }
    
    required init?(coder: NSCoder) {
        self.viewModel = .init([])
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupBindings()
    }
    
    // MARK: Methods
    private func setupViews() {
        title = NSLocalizedString("letters title", comment: "Letters View Controller title")
        collectionView.register(
            LetterCollectionViewCell.self,
            forCellWithReuseIdentifier: LetterCollectionViewCell.identifier
        )
        collectionView.collectionViewLayout = collectionLayout()
    }
    
    private func setupBindings() {
        viewModel.$snapshot
            .compactMap { $0 }
            .sink { [weak self] snapshot in
                self?.dataSource.apply(snapshot)
            }.store(in: &subscriptions)
    }
    
    private func initiateDataSource() -> DataSource {
        DataSource(collectionView: collectionView) { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LetterCollectionViewCell.identifier, for: indexPath) as? LetterCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            cell.letter = item
            
            return cell
        }
    }
    
    private func collectionLayout() -> UICollectionViewLayout {
        UICollectionViewCompositionalLayout { section, env in
            let item = NSCollectionLayoutItem(layoutSize: .init(
                widthDimension: .fractionalWidth(1.0 / 3.0),
                heightDimension: .fractionalWidth(1.0 / 3.0)
            ))
            
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: .init(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalWidth(1.0 / 3.0)
                ),
                repeatingSubitem: item,
                count: 3
            )
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
            return section
        }
    }
}
