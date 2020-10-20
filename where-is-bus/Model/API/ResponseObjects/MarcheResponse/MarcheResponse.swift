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
    let transportsOnEndStop: TransportsOnEndStopResponse?
    
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
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.transportTypeId = try container.decode(Int.self, forKey: .transportTypeId)
        self.transportTypeTitle = try container.decode(String.self, forKey: .transportTypeTitle)
        self.marchTitle = try container.decode(String.self, forKey: .marchTitle)
        self.forecastTime = try container.decode(String.self, forKey: .forecastTime)
        self.directionsInfo = try container.decode(DirectionsInfoResponse.self, forKey: .directionsInfo)
        
        // Приходит массив, если там ничего нет и словарь, если есть (тупые транспортники сука)
        if let _ = try? container.decode(Array<TransportsOnEndStopResponse>.self, forKey: .transportsOnEndStop) {
            self.transportsOnEndStop = nil
        } else {
            let transportsOnEndStop = try container.decode(TransportsOnEndStopResponse.self, forKey: .transportsOnEndStop)
            self.transportsOnEndStop = transportsOnEndStop
        }
        
        self.marcheLines = try container.decode(MarcheLinesResponse.self, forKey: .marcheLines)
    }
    
}
