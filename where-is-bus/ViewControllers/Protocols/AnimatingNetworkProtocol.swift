//
//  AnimatingNetworkProtocol.swift
//  where-is-bus
//
//  Created by art-off on 13.10.2020.
//  Copyright © 2020 art-off. All rights reserved.
//

import Foundation

import UIKit

protocol AnimatingNetworkProtocol {
    
    // MARK: - Нужно реализовать
    func animatingSuperViewForDisplay() -> UIView
    func animatingViewForDisableUserInteraction() -> UIView
    
    func animatingActivityIndicatorView() -> ActivityIndicatorView
    func animatingAlertView() -> AlertView
    
    // MARK: - Реализованные
    func startActivityIndicator()
    func stopActivityIndicator()
    func showAlert(withText alertText: String)
    func showNetworkAlert()
    
}

extension AnimatingNetworkProtocol {
    
    // MARK: Activity Indicator
    func startActivityIndicator() {
        let superViewForDisplay = animatingSuperViewForDisplay()
        let activityIndicatioView = animatingActivityIndicatorView()
        let viewForDisableUserIntetaction = animatingSuperViewForDisplay()
        
        if !superViewForDisplay.subviews.contains(activityIndicatioView) {
            superViewForDisplay.addSubview(activityIndicatioView)
            activityIndicatioView.translatesAutoresizingMaskIntoConstraints = false
            activityIndicatioView.addConstraintsOnAllSides(to: superViewForDisplay.safeAreaLayoutGuide, withConstant: 0)
        }
        activityIndicatioView.startAnimating()
        viewForDisableUserIntetaction.isUserInteractionEnabled = false
    }
    
    func stopActivityIndicator() {
        let activityIndicatioView = animatingActivityIndicatorView()
        let viewForDisableUserIntetaction = animatingSuperViewForDisplay()
        
        activityIndicatioView.stopAnimating()
        viewForDisableUserIntetaction.isUserInteractionEnabled = true
    }
    
    // MARK: Alert View
    func showAlert(withText alertText: String) {
        let superViewForDisplay = animatingSuperViewForDisplay()
        let alertView = animatingAlertView()
        
        if !superViewForDisplay.subviews.contains(animatingAlertView()) {
            superViewForDisplay.addSubview(animatingAlertView())

            alertView.translatesAutoresizingMaskIntoConstraints = false
            alertView.centerYAnchor.constraint(equalTo: superViewForDisplay.safeAreaLayoutGuide.centerYAnchor).isActive = true
            alertView.centerXAnchor.constraint(equalTo: superViewForDisplay.safeAreaLayoutGuide.centerXAnchor).isActive = true
        }

        alertView.alertLabel.text = alertText
        alertView.hideWithAnimation()
    }

    func showNetworkAlert() {
        showAlert(withText: "Проблемы с интернетом")
    }
    
}
