//
//  BusesCollectionViewController.swift
//  where-is-bus
//
//  Created by art-off on 12.10.2020.
//  Copyright © 2020 art-off. All rights reserved.
//

import UIKit

class BusesCollectionViewController: MarchesCollectionViewController {
    
    // MARK: - Property for Api
    private let apiManager = ApiManager()
    
    
    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let buses = Common.shared.threeMarches?.buses {
            marches = buses
        } else {
            loadThreeMarchesAndSetBusses()
        }
    }
    
    
    // MARK: - Private Methods
    private func loadThreeMarchesAndSetBusses() {
        apiManager.loadThreeMarches { threeMarchesOptional in
            guard let threeMarches = threeMarchesOptional else {
                NSLog("Don't load Three Marches")
                return
            }

            DispatchQueue.main.async {
                Common.shared.threeMarches = threeMarches
            }

            guard let buses = threeMarches.buses else {
                NSLog("ThreeMarches.busses in Nil")
                return
            }

            DispatchQueue.main.async {
                self.set(marches: buses)
            }
        }
    }
    
}
