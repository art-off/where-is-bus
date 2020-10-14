//
//  MarhcesCollectionViewController.swift
//  where-is-bus
//
//  Created by art-off on 15.10.2020.
//  Copyright © 2020 art-off. All rights reserved.
//

import UIKit

class MarchesCollectionViewController: UICollectionViewController {
    
    private let reuseIdentifier = TransportCollectionViewCell.reuseIdentifier
    
    // MARK: - Properties for layout Collection View
    private let spacing: CGFloat = 6
    private lazy var itemWidth = CollectionViewHepler.getItemWidth(
        byCollectionViewWidth: collectionView.bounds.width,
        minItemWidth: 60,
        spacing: spacing)
    
    // MARK: - Properties for load Marches Title
    private let activityIndicatorView = ActivityIndicatorView()
    private let alertView = AlertView()
    
    // MARK: - Data Source
    var marches = [TMMarche]()
    
    
    
    // MARK: - Overrides
    override func loadView() {
        super.loadView()
        
        collectionView.register(
            TransportCollectionViewCell.self,
            forCellWithReuseIdentifier: reuseIdentifier)
        
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    
    // MARK: - Methods
    func set(marches: [TMMarche]) {
        self.marches = marches
        collectionView.reloadData()
    }
    
}


// MARK: - UI Collection View Data Source
extension MarchesCollectionViewController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return marches.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: reuseIdentifier,
            for: indexPath) as! TransportCollectionViewCell
        
        let marche = marches[indexPath.row]
        
        cell.marcheTitle = marche.title
        cell.numberMarches = "\(marche.info.directionA.transportCount) / \(marche.info.directionB.transportCount)"
        
        return cell
    }
    
}

// MARK: - UI Collection View Delegate Flow Layout
extension MarchesCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: itemWidth, height: itemWidth)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
    }
    
}

// MARK: - Animating Network Protocol
extension MarchesCollectionViewController: AnimatingNetworkProtocol {
    
    func animatingSuperViewForDisplay() -> UIView {
        return view
    }
    
    func animatingViewForDisableUserInteraction() -> UIView {
        return view
    }
    
    func animatingActivityIndicatorView() -> ActivityIndicatorView {
        return activityIndicatorView
    }
    
    func animatingAlertView() -> AlertView {
        return alertView
    }
    
}
