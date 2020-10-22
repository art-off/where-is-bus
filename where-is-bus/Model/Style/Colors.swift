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
    
    static var green: UIColor {
        return UIColor(red: 0, green: 84.0/255.0, blue: 16.0/255.0, alpha: 1)
    }
    
    static var yellow: UIColor {
        return UIColor(red: 210.0/255.0, green: 208.0/255.0, blue: 46.0/255.0, alpha: 1)
    }
    
    static var red: UIColor {
        return UIColor(red: 237.0/255.0, green: 76.0/255.0, blue: 76.0/255.0, alpha: 1)
    }
    
}
