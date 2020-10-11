//
//  ThreeMarches.swift
//  where-is-bus
//
//  Created by art-off on 05.10.2020.
//  Copyright © 2020 art-off. All rights reserved.
//

import Foundation

struct ThreeMarches {
    
    let buses: [String: TMMarche]?
    let trolleybuses: [String: TMMarche]?
    let trams: [String: TMMarche]?
    
}

struct TMMarche {
    
    let directionA: TMMarcheDirectionInfo
    let directionB: TMMarcheDirectionInfo
    
}

struct TMMarcheDirectionInfo {
    
    let firstStop: String
    let lastStop: String
    let transportCount: Int
    let mark: String?
    
}
