//
//  TramsCollectionViewController.swift
//  where-is-bus
//
//  Created by art-off on 15.10.2020.
//  Copyright © 2020 art-off. All rights reserved.
//

import UIKit

class TramsCollectionViewController: MarchesCollectionViewController {
    
    // MARK: - Property for Api
    private let apiManager = ApiManager()
    
    
    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let trams = Common.shared.threeMarches?.trams {
            marches = trams
        } else {
            loadThreeMarchesAndSetTrams()
        }
    }
    
    
    // MARK: - Private Methods
    private func loadThreeMarchesAndSetTrams() {
        startActivityIndicator()
        apiManager.loadThreeMarches { threeMarchesOptional in
            guard let threeMarches = threeMarchesOptional else {
                NSLog("Don't load Three Marches")
                self.stopActivityIndicator()
                self.showAlert(withText: "Проблемы с сервером")
                return
            }

            DispatchQueue.main.async {
                Common.shared.threeMarches = threeMarches
            }

            guard let trams = threeMarches.trams else {
                NSLog("ThreeMarches.trams in Nil")
                self.stopActivityIndicator()
                self.showAlert(withText: "Проблемы с сервером")
                return
            }

            DispatchQueue.main.async {
                self.set(marches: trams)
                self.stopActivityIndicator()
            }
        }
    }
    
}
