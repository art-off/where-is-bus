//
//  DirectionDetailInfoResponse.swift
//  where-is-bus
//
//  Created by art-off on 11.10.2020.
//  Copyright © 2020 art-off. All rights reserved.
//

import Foundation

class DirectionsInfoResponse: Decodable {
    
    let directionA: DirectionDetailInfoResponse
    let directionB: DirectionDetailInfoResponse
    
    enum CodingKeys: String, CodingKey {
        case directionA = "A"
        case directionB = "B"
    }
    
}

class DirectionDetailInfoResponse: Decodable {
    
    let firstStop: String
    let lastStop: String
    let length: Double
    
    enum CodingKeys: String, CodingKey {
        case firstStop = "first"
        case lastStop = "last"
        case length
    }
    
}
