//
//  MarcheResponse.swift
//  where-is-bus
//
//  Created by art-off on 08.10.2020.
//  Copyright © 2020 art-off. All rights reserved.
//

import Foundation

class MarcheResponse: Decodable {
    
    let transportTypeId: Int
    let transportTypeTitle: String
    let marchTitle: String
    let forecastTime: String
    
    let directionsInfo: DirectionsInfoResponse
    let transportsOnEndStop: TransportsOnEndStopResponse
    
    let marcheLines: MarcheLinesResponse
    
    
    enum CodingKeys: String, CodingKey {
        case transportTypeId = "ts_type_id"
        case transportTypeTitle = "ts_type_title"
        case marchTitle = "marsh_title"
        case forecastTime = "forecast"
        case directionsInfo = "directions"
        case transportsOnEndStop = "ts_endstop"
        case marcheLines = "ts_line"
    }
    
}
