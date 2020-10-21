//
//  Colors.swift
//  where-is-bus
//
//  Created by art-off on 22.10.2020.
//  Copyright © 2020 art-off. All rights reserved.
//

import UIKit

class Colors {
    
    static var backgroundColor: UIColor {
        return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
            if UITraitCollection.userInterfaceStyle == .dark {
                return UIColor.black
            } else {
                return UIColor.white
            }
        }
    }
    
}
