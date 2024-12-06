//
//  LetterCollectionViewCell.swift
//  livecoding
//
//  Created by Hosein Abbaspour on 12/5/24.
//

import UIKit

class LetterCollectionViewCell: UICollectionViewCell {
    
    var letter: String? {
        get { letterLabel.text }
        set { letterLabel.text = newValue }
    }
    
    private lazy var letterContainerView: UIView = {
        let view = UIView()
        view.layer.cornerCurve = .continuous
        view.layer.cornerRadius = 16
        view.backgroundColor = .secondarySystemFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var letterLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 21, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Properties
    static var identifier: String {
        String(describing: self)
    }
    
    //MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupViews()
    }
    
    //MARK: - Methods
    private func setupViews() {
        contentView.addSubview(letterContainerView)
        letterContainerView.addSubview(letterLabel)
        
        NSLayoutConstraint.activate([
            letterContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            letterContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            letterContainerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            letterContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            letterLabel.leadingAnchor.constraint(equalTo: letterContainerView.leadingAnchor, constant: 0),
            letterLabel.trailingAnchor.constraint(equalTo: letterContainerView.trailingAnchor, constant: 0),
            letterLabel.topAnchor.constraint(equalTo: letterContainerView.topAnchor, constant: 0),
            letterLabel.bottomAnchor.constraint(equalTo: letterContainerView.bottomAnchor, constant: 0)
        ])
    }
}
