//
//  CollectionViewHelper.swift
//  where-is-bus
//
//  Created by art-off on 13.10.2020.
//  Copyright © 2020 art-off. All rights reserved.
//

import UIKit

class CollectionViewHepler {
    
    static func getItemWidth(byCollectionViewWidth collectionViewWidth: CGFloat, minItemWidth: CGFloat, spacing: CGFloat) -> CGFloat {
        let numberOfItemsPerRos = CGFloat(Int((collectionViewWidth - spacing) / (minItemWidth + spacing)))
        let totalSpacingWidth = (numberOfItemsPerRos + 1) * spacing
        let itemWidth = CGFloat(Int((collectionViewWidth - totalSpacingWidth) / numberOfItemsPerRos))
        
        return itemWidth
    }
    
}
