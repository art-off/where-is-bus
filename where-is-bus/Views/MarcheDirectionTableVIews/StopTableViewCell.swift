//
//  StopTableViewCell.swift
//  where-is-bus
//
//  Created by art-off on 22.10.2020.
//  Copyright © 2020 art-off. All rights reserved.
//

import UIKit

class StopTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "StopTableCell"
    
    // MARK: - Outlers
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var separatorView: UIView!
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Propetries
    var time: String! {
        didSet { timeLabel.text = time }
    }
    var title: String! {
        didSet { titleLabel.text = title }
    }
    
    
    // MARK: - Overrides
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.cornerRadius = 15
        
        containerView.backgroundColor = .link
        timeLabel.textColor = .white
        titleLabel.textColor = .white
        
        containerView.makeShadow(color: .black, opacity: 0.5, radius: 2)
    }
    
}
