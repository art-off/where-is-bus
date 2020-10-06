//
//  ThreeMarchesResponse.swift
//  where-is-bus
//
//  Created by art-off on 05.10.2020.
//  Copyright © 2020 art-off. All rights reserved.
//

import Foundation

class ThreeMarchesResponse: Decodable {
    
    let buses: [String: MarcheResponse]?
    let trolleybuses: [String: MarcheResponse]?
    let trams: [String: MarcheResponse]?
    
    enum CodingKeys: String, CodingKey {
        case buses = "1"
        case trolleybuses = "2"
        case trams = "3"
    }
    
}

class MarcheResponse: Decodable {
    
    let directionA: MarcheDirectionInfoResponse
    let directionB: MarcheDirectionInfoResponse
    
    enum CodingKeys: String, CodingKey {
        case directionA = "A"
        case directionB = "B"
    }
    
}

class MarcheDirectionInfoResponse: Decodable {
    
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
