//
//  TrolleybusesCollectionViewController.swift
//  where-is-bus
//
//  Created by art-off on 15.10.2020.
//  Copyright © 2020 art-off. All rights reserved.
//

import UIKit

class TrolleybusesCollectionViewController: MarchesCollectionViewController {
    
    // MARK: - Property for Api
    private let apiManager = ApiManager()
    
    
    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let trolleybuses = Common.shared.threeMarches?.trolleybuses {
            marches = trolleybuses
        } else {
            loadThreeMarchesAndSetTrolleybuses()
        }
    }
    
    
    // MARK: - Private Methods
    private func loadThreeMarchesAndSetTrolleybuses() {
        apiManager.loadThreeMarches { threeMarchesOptional in
            guard let threeMarches = threeMarchesOptional else {
                NSLog("Don't load Three Marches")
                return
            }

            DispatchQueue.main.async {
                Common.shared.threeMarches = threeMarches
            }

            guard let trolleybuses = threeMarches.trolleybuses else {
                NSLog("ThreeMarches.trolleybuses in Nil")
                return
            }

            DispatchQueue.main.async {
                self.set(marches: trolleybuses)
            }
        }
    }
    
}
