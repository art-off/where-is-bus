//
//  MarcheDirectionInfoTableViewCell.swift
//  where-is-bus
//
//  Created by art-off on 21.10.2020.
//  Copyright © 2020 art-off. All rights reserved.
//

import UIKit

class MarcheDirectionInfoTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "MarcheDirectionInfoTableCell"
    
    // MARK: - Outlets
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var firstStopLabel: UILabel!
    @IBOutlet weak var lastStopLabel: UILabel!
    
    
    // MARK: - Properties
    var firstStop: String! {
        didSet { firstStopLabel.text = firstStop }
    }
    var lastStop: String! {
        didSet { lastStopLabel.text = lastStop }
    }
    
    
    // MARK: - Overrides
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.cornerRadius = 15
        
        containerView.backgroundColor = .link
        firstStopLabel.textColor = .white
        lastStopLabel.textColor = .white
        
        //isUserInteractionEnabled = false

        containerView.makeShadow(color: .black, opacity: 0.5, radius: 5)
    }
    
}
