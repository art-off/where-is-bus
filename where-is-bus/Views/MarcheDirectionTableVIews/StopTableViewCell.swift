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
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
