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
        
        navigationItem.title = "Автобусы"
        navigationItem.largeTitleDisplayMode = .never
        
        if let buses = Common.shared.threeMarches?.buses {
            marches = buses
        } else {
            loadThreeMarchesAndSetBusses()
        }
    }
    
    
    // MARK: - Private Methods
    private func loadThreeMarchesAndSetBusses() {
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

            guard let buses = threeMarches.buses else {
                NSLog("ThreeMarches.buses in Nil")
                self.stopActivityIndicator()
                self.showAlert(withText: "Проблемы с сервером")
                return
            }

            DispatchQueue.main.async {
                self.set(marches: buses)
                self.stopActivityIndicator()
            }
        }
    }
    
}

// MARK: - Collection View Controller Delegate
extension BusesCollectionViewController {
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let title = marches[indexPath.row].title
        
        startActivityIndicator()
        apiManager.loadMarche(for: title) { optionalMarche in
            guard let marche = optionalMarche else {
                DispatchQueue.main.async {
                    self.stopActivityIndicator()
                    self.showNetworkAlert()
                }
                return
            }
            
            DispatchQueue.main.async {
                let vc = MarchePageViewController(marche: marche)
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
            DispatchQueue.main.async {
                self.stopActivityIndicator()
            }
        }
    }
    
}
