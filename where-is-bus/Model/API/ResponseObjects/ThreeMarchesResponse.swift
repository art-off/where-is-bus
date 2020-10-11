//
//  ThreeMarchesResponse.swift
//  where-is-bus
//
//  Created by art-off on 05.10.2020.
//  Copyright © 2020 art-off. All rights reserved.
//

import Foundation

class ThreeMarchesResponse: Decodable {
    
    let buses: [String: TMMarcheResponse]?
    let trolleybuses: [String: TMMarcheResponse]?
    let trams: [String: TMMarcheResponse]?
    
    enum CodingKeys: String, CodingKey {
        case buses = "1"
        case trolleybuses = "2"
        case trams = "3"
    }
    
}

class TMMarcheResponse: Decodable {
    
    let directionA: TMMarcheDirectionInfoResponse
    let directionB: TMMarcheDirectionInfoResponse
    
    enum CodingKeys: String, CodingKey {
        case directionA = "A"
        case directionB = "B"
    }
    
}

class TMMarcheDirectionInfoResponse: Decodable {
    
    let firstStop: String
    let lastStop: String
    let transportCount: Int
    let mark: String?
    
    enum CodingKeys: String, CodingKey {
        case firstStop = "first"
        case lastStop = "last"
        case transportCount = "ts_count"
        case mark
    }
    
}
