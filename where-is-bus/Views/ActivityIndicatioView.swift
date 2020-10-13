//
//  ActivityIndicatioView.swift
//  where-is-bus
//
//  Created by art-off on 13.10.2020.
//  Copyright © 2020 art-off. All rights reserved.
//

import UIKit

class ActivityIndicatorView: UIView {
    
    private let loadingView = UIView()
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    // MARK: - Setup Views
    private func setupViews() {
        backgroundColor = .clear
        
        activityIndicator.color = .white
        
        loadingView.backgroundColor = UIColor(red: 0.25, green: 0.25, blue: 0.25, alpha: 0.7)
        loadingView.layer.cornerRadius = 15
        
        addSubview(loadingView)
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        loadingView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        loadingView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        loadingView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        loadingView.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: loadingView.centerYAnchor).isActive = true
        activityIndicator.heightAnchor.constraint(equalToConstant: 40).isActive = true
        activityIndicator.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.isHidden = true
    }
    
    // MARK: - Animating
    func startAnimating() {
        isHidden = false
        activityIndicator.startAnimating()
    }
    
    func stopAnimating() {
        isHidden = true
        activityIndicator.stopAnimating()
    }

}
