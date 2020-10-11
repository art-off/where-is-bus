//
//  MarcheLines.swift
//  where-is-bus
//
//  Created by art-off on 11.10.2020.
//  Copyright © 2020 art-off. All rights reserved.
//

import Foundation

struct MarcheLines {

    let directionA: [MarcheLineObject]
    let directionB: [MarcheLineObject]
    
}

enum MarcheLineObject {
    
    case transport(Transport)
    case stop(Stop)
    case unsupported
    
}
