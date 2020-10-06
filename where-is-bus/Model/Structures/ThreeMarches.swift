//
//  ThreeMarches.swift
//  where-is-bus
//
//  Created by art-off on 05.10.2020.
//  Copyright © 2020 art-off. All rights reserved.
//

import Foundation

struct ThreeMarches {
    
    let buses: [String: Marche]?
    let trolleybuses: [String: Marche]?
    let trams: [String: Marche]?
    
}

struct Marche {
    
    let directionA: MarcheDirectionInfo
    let directionB: MarcheDirectionInfo
    
}

struct MarcheDirectionInfo {
    
    let firstStop: String
    let lastStop: String
    let transportCount: Int
    let mark: String?
    
}
