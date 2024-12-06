//
//  UserInfoView.swift
//  livecoding
//
//  Created by Hosein Abbaspour on 3/9/24.
//

import UIKit

class UserInfoView: UIStackView {
    
    //MARK: - UI Components
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .secondaryLabel
        imageView.contentMode = .center
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.numberOfLines = 3
        
        return label
    }()
    
    //MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        
        setupViews()
    }
    
    private func setupViews() {
        addArrangedSubview(iconImageView)
        addArrangedSubview(titleLabel)
        spacing = 8
        alignment = .top
    }
    
    //MARK: - Methods
    func set(title: String?, systemImageName: String, font: UIFont = .systemFont(ofSize: 13, weight: .medium)) {
        titleLabel.text = title
        titleLabel.font = font
        
        let iconConfig = UIImage.SymbolConfiguration(font: font)
        iconImageView.image = UIImage(
            systemName: systemImageName,
            withConfiguration: iconConfig
        )
    }
}
