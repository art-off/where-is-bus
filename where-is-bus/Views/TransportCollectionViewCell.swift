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
    
    // MARK: - Outlets
    @IBOutlet weak var marcheTitleLabel: UILabel!
    @IBOutlet weak var numberMarchesLabel: UILabel!
    
    // MARK: - Properties
    var marcheTitle: String! {
        didSet { marcheTitleLabel.text = marcheTitle }
    }
    
    var numberMarches: String! {
        didSet { numberMarchesLabel.text = numberMarches }
    }

}
