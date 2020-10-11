//
//  TransportOnEndStopResponse.swift
//  where-is-bus
//
//  Created by art-off on 11.10.2020.
//  Copyright © 2020 art-off. All rights reserved.
//

import Foundation

class TransportsOnEndStopResponse: Decodable {
    
    let directionA: [TransportResponse]?
    let directionB: [TransportResponse]?
    
    enum CodingKeys: String, CodingKey {
        case directionA = "A"
        case directionB = "B"
    }
    
}
