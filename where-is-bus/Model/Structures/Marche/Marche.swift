//
//  Marche.swift
//  where-is-bus
//
//  Created by art-off on 11.10.2020.
//  Copyright © 2020 art-off. All rights reserved.
//

import Foundation

struct Marche {
    
    let typeId: Int
    let typeTitle: String
    let title: String
    let forecastTime: String
    
    let directionsInfo: DirectionsInfo
    let transportsOnEndStop: TransportsOnEndStop?
    
    let marcheLines: MarcheLines
    
}

