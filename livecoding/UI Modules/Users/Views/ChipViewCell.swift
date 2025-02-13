//
//  MoodCollectionViewCell.swift
//  musicai
//
//  Created by Hosein Abbaspour on 8/7/24.
//

import UIKit

class ChipViewCell: UICollectionViewCell {
    
    // MARK: - UI Elements
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        
        view.font = .preferredFont(forTextStyle: .subheadline)
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    // MARK: - Properties
    static var identifier: String {
        String(describing: self)
    }
    
    var title: String? {
        get { titleLabel.text }
        set { titleLabel.text = newValue }
    }
    
    override var isSelected: Bool {
        didSet {
            updateSelectionAppearance()
        }
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
    
    // MARK: - Methods
    func setupViews() {
        updateSelectionAppearance()
        
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    override func layoutSubviews() {
        contentView.layer.cornerCurve = .continuous
        contentView.layer.cornerRadius = contentView.bounds.height / 2
    }
    
    private func updateSelectionAppearance() {
        contentView.backgroundColor = isSelected ? .systemYellow : .secondarySystemFill
        titleLabel.textColor = .label
    }
}
