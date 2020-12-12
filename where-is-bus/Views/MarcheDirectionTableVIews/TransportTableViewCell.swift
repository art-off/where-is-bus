//
//  TransportTableViewCell.swift
//  where-is-bus
//
//  Created by art-off on 22.10.2020.
//  Copyright © 2020 art-off. All rights reserved.
//

import UIKit

class TransportTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "TransportTableCell"
    
    // MARK: - Outlers
    @IBOutlet weak var containerView: UIView!
    
//    @IBOutlet weak var transportImageView: UIImageView!
//    @IBOutlet weak var commentLabel: UILabel!
    
    @IBOutlet weak var imageConteinerView: UIView!
    @IBOutlet weak var transportImageView: UIImageView!
    @IBOutlet weak var commentLabel: UILabel!
    
    
    // MARK: - Properties
    var comment: String! {
        didSet { commentLabel.text = comment }
    }
    
    
    // MARK: - Overrides
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.cornerRadius = 15
        
        containerView.backgroundColor = .systemOrange
        commentLabel.textColor = .white
        
        imageConteinerView.layer.cornerRadius = 15
        imageConteinerView.backgroundColor = .white
        
        containerView.makeShadow(color: .black, opacity: 0.5, radius: 2)
    }
    
    // MARK: - Methods
    func setImage(name: String) {
        imageView?.image = nil
        
        ApiManager().downloadImage(imageName: name) { optionalImage in
            guard let image = optionalImage else { return }
            
            DispatchQueue.main.async {
                self.transportImageView.image = self.transportImageView.image?.withRenderingMode(.alwaysTemplate)
                self.transportImageView.tintColor = .green
                self.transportImageView.image = image
            }
        }
    }
    
}
