//
//  AlertView.swift
//  where-is-bus
//
//  Created by art-off on 13.10.2020.
//  Copyright © 2020 art-off. All rights reserved.
//

import UIKit

class AlertView: UIView {
    
    let alertLabel = UILabel()
    
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    convenience init(alertText: String) {
        self.init()
        alertLabel.text = alertText
    }
    
    // MARK: - Setup Views
    private func commonInit() {
        setupViews()
    }
    
    private func setupViews() {
        backgroundColor = .yellow
        layer.cornerRadius = 15
        setupLabels()
    }
    
    private func setupLabels() {
        alertLabel.textColor = .gray
        alertLabel.textAlignment = .center
        alertLabel.numberOfLines = 0
        alertLabel.lineBreakMode = .byWordWrapping
        
        addSubview(alertLabel)
        alertLabel.translatesAutoresizingMaskIntoConstraints = false
        alertLabel.addConstraintsOnAllSides(to: self, withConstant: 8)
    }
    
    // MARK: - Скрытие view с анимацией
    func hideWithAnimation() {
        alpha = 1.0
        isHidden = false
        
        UIView.animate(
            withDuration: 3.0,
            animations: {
                self.alpha = 0.0
            },
            completion: { finished in
                if finished { self.isHidden = true }
            }
        )
    }

}
