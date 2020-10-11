//
//  DirectionDetailInfo.swift
//  where-is-bus
//
//  Created by art-off on 11.10.2020.
//  Copyright © 2020 art-off. All rights reserved.
//

import Foundation

struct DirectionsInfo {
    
    let directionA: DirectionDetailInfo
    let directionB: DirectionDetailInfo
    
}

struct DirectionDetailInfo {
    
    let firstStop: String
    let lastStop: String
    let length: Double
    
}
