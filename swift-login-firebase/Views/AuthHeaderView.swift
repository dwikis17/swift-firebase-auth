//
//  AuthHeaderView.swift
//  swift-login-firebase
//
//  Created by Dwiki Dwiki on 26/10/23.
//

import UIKit

class AuthHeaderView: UIView {

    
    //MARK: - UI Components
    private let logo: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "logo")
        return iv
    }()
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 26, weight: .bold)
        label.text = "Sign In"
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.text = "Subtitle"
        return label
    }()
    
    //MARK: - Lifecycle
    init(title: String, subTitle: String) {
        super.init(frame: .zero)
        self.titleLabel.text = title
        self.subTitleLabel.text = subTitle
        
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - UI Setup
    private func setupUI() {
        self.addSubview(logo)
        self.addSubview(titleLabel)
        self.addSubview(subTitleLabel)
        
        logo.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.logo.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.logo.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.logo.widthAnchor.constraint(equalToConstant: 90),
            self.logo.heightAnchor.constraint(equalTo: logo.widthAnchor),
            
            self.titleLabel.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 20),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),   
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            self.subTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),

        ])
    }

    }

