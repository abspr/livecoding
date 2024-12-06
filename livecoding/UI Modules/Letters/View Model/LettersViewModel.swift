//
//  LettersViewModel.swift
//  livecoding
//
//  Created by Hosein Abbaspour on 12/5/24.
//

import UIKit

class LettersViewModel {
    
    // MARK: - Types
    typealias DataSourceSnapshot = NSDiffableDataSourceSnapshot<Section, String>
    typealias DataSource = UICollectionViewDiffableDataSource<Section, String>
    
    enum Section {
        case letters
    }
    
    // MARK: - Properties
    @Published var snapshot: DataSourceSnapshot?
    
    // MARK: - Life Cycle
    init(_ letters: [String]) {
        updateSnapshot(using: letters)
    }
    
    // MARK: - Methods
    private func updateSnapshot(using letters: [String]) {
        var snapshot = DataSourceSnapshot()
        snapshot.appendSections([.letters])
        snapshot.appendItems(letters)
        self.snapshot = snapshot
    }
    
}
