//
//  UserTableViewCell.swift
//  quandoo
//
//  Created by Hosein Abbaspour on 3/9/24.
//

import UIKit
import SnapKit

class UserTableViewCell: UITableViewCell {
    
    //MARK: - UI Components
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        
        return label
    }()
    
    private(set) lazy var usernameView = UserInfoView()
    private(set) lazy var emailView = UserInfoView()
    private(set) lazy var addressView = UserInfoView()
    
    //MARK: - Properties
    static var identifier: String {
        String(describing: self)
    }
    
    var name: String? {
        get { nameLabel.text }
        set { nameLabel.text = newValue }
    }
    
    //MARK: - LifeCycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupViews()
    }
    
    //MARK: - Methods
    private func setupViews() {
        accessoryType = .disclosureIndicator
        
        let stackView = UIStackView(arrangedSubviews: [
            nameLabel, usernameView, emailView, addressView
        ])
        
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.setCustomSpacing(8, after: nameLabel)
        
        contentView.addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(20)
        }
    }
}
