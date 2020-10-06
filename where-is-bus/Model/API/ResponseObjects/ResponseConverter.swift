//
//  ResponseConverter.swift
//  where-is-bus
//
//  Created by art-off on 05.10.2020.
//  Copyright © 2020 art-off. All rights reserved.
//

import Foundation

class ResponseConverter {
    
    static func converte(marchesResponse: ThreeMarchesResponse) -> ThreeMarches {
        let marches = ThreeMarches(
            buses: converte(marcheResponse: marchesResponse.buses),
            trolleybuses: converte(marcheResponse: marchesResponse.trolleybuses),
            trams: converte(marcheResponse: marchesResponse.trams))
        
        return marches
    }
}

extension ResponseConverter {
    
    private static func converte(marcheResponse: [String: MarcheResponse]?) -> [String: Marche]? {
        guard let marcheResponse = marcheResponse else { return nil }
        
        var marches = [String: Marche]()
        for (key, value) in marcheResponse {
            let marche = Marche(
                directionA: converte(marcheDirectionInfoResponse: value.directionA),
                directionB: converte(marcheDirectionInfoResponse: value.directionB))
            marches[key] = marche
        }
        
        return marches
    }
    
    private static func converte(marcheDirectionInfoResponse: MarcheDirectionInfoResponse) -> MarcheDirectionInfo {
        let marcheDirectionInfo = MarcheDirectionInfo(
            firstStop: marcheDirectionInfoResponse.firstStop,
            lastStop: marcheDirectionInfoResponse.lastStop,
            transportCount: marcheDirectionInfoResponse.transportCount,
            mark: marcheDirectionInfoResponse.mark)
        
        return marcheDirectionInfo
    }
    
}
