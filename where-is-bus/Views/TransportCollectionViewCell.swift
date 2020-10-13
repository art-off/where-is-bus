//
//  TransportCollectionViewCell.swift
//  where-is-bus
//
//  Created by art-off on 12.10.2020.
//  Copyright © 2020 art-off. All rights reserved.
//

import UIKit

class TransportCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "TransportCollectionCell"
    
    // MARK: - Private Views
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()
    private let marcheTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = .white
        return label
    }()
    private let numberMarchesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    // MARK: - Properties
    var marcheTitle: String! {
        didSet { marcheTitleLabel.text = marcheTitle }
    }
    
    var numberMarches: String! {
        didSet { numberMarchesLabel.text = numberMarches }
    }
    
    // MARK: - Overrides
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    // MARK: - Setup Views
    func setupViews() {
        backgroundColor = .link
        
        layer.cornerRadius = 15
        
        stackView.addArrangedSubview(marcheTitleLabel)
        stackView.addArrangedSubview(numberMarchesLabel)
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }

}
