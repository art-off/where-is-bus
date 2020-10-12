//
//  CollectionViewHelper.swift
//  where-is-bus
//
//  Created by art-off on 13.10.2020.
//  Copyright © 2020 art-off. All rights reserved.
//

import UIKit

class CollectionViewHepler {
    
    static func getSpacing(byCollectionViewWidth collectionViewWidth: CGFloat, itemWidth: CGFloat, minSpacing: CGFloat) -> CGFloat {
        let numberOfItemsPerRow = CGFloat(Int((collectionViewWidth - minSpacing) / (itemWidth + minSpacing)))
        let totalWidthItems = numberOfItemsPerRow * itemWidth
        let spacing: CGFloat = CGFloat(Int((collectionViewWidth - totalWidthItems) / (numberOfItemsPerRow + 1)))
        
        return spacing
    }
    
}
