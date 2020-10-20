//
//  ResponseConverter.swift
//  where-is-bus
//
//  Created by art-off on 05.10.2020.
//  Copyright © 2020 art-off. All rights reserved.
//

import Foundation

class ResponseConverter {
    
    static func converte(threeMarchesResponse: ThreeMarchesResponse) -> ThreeMarches {
        let threeMarches = ThreeMarches(
            buses: converte(marcheResponse: threeMarchesResponse.buses),
            trolleybuses: converte(marcheResponse: threeMarchesResponse.trolleybuses),
            trams: converte(marcheResponse: threeMarchesResponse.trams))
        
        let sortFunc: (TMMarche, TMMarche) -> Bool = { m1, m2 in
            let title1 = m1.title
            let title2 = m2.title
            
            if let numberString1 = title1.firstMarch(with: "\\d+"),
               let numberString2 = title2.firstMarch(with: "\\d+") {
                return Int(numberString1)! < Int(numberString2)!
            }
            
            if let alpabets1 = title1.firstMarch(with: "\\D+"),
               let alpabets2 = title1.firstMarch(with: "\\D+") {
                return alpabets1 > alpabets2
            }
            
            return title1 < title2
        }
        
        let sortedThreeMarches = ThreeMarches(
            buses: threeMarches.buses?.sorted(by: sortFunc),
            trolleybuses: threeMarches.trolleybuses?.sorted(by: sortFunc),
            trams: threeMarches.trams?.sorted(by: sortFunc))
        
        return sortedThreeMarches
    }
    
    static func converte(marcheResponse: MarcheResponse) -> Marche {
        let marche = Marche(
            typeId: marcheResponse.transportTypeId,
            typeTitle: marcheResponse.transportTypeTitle,
            title: marcheResponse.marchTitle,
            forecastTime: marcheResponse.forecastTime,
            directionsInfo: converte(directionsInfoResponse: marcheResponse.directionsInfo),
            transportsOnEndStop: converte(transportsOnEndStopResponse: marcheResponse.transportsOnEndStop),
            marcheLines: converte(marcheLinesResponse: marcheResponse.marcheLines))
        
        return marche
    }
}

// MARK: - Конвертация ThreeMarchesResponse
extension ResponseConverter {
    
    private static func converte(marcheResponse: [String: TMMarcheResponse]?) -> [TMMarche]? {
        guard let marcheResponse = marcheResponse else { return nil }
        
        var marches = [TMMarche]()
        for (key, value) in marcheResponse {
            let marche = TMMarche(
                title: key,
                info: TMMarcheInfo(
                    directionA: converte(marcheDirectionInfoResponse: value.directionA),
                    directionB: converte(marcheDirectionInfoResponse: value.directionB)))
            marches.append(marche)
        }
        
        return marches
    }
    
    private static func converte(marcheDirectionInfoResponse: TMMarcheDirectionInfoResponse) -> TMMarcheDirectionInfo {
        let marcheDirectionInfo = TMMarcheDirectionInfo(
            firstStop: marcheDirectionInfoResponse.firstStop,
            lastStop: marcheDirectionInfoResponse.lastStop,
            transportCount: marcheDirectionInfoResponse.transportCount,
            mark: marcheDirectionInfoResponse.mark)
        
        return marcheDirectionInfo
    }
    
}

// MARK: - Конвертация MarcheResponse
extension ResponseConverter {
    
    private static func converte(directionsInfoResponse: DirectionsInfoResponse) -> DirectionsInfo {
        let directionsInfo = DirectionsInfo(
            directionA: converte(directionDetailInfoResponse: directionsInfoResponse.directionA),
            directionB: converte(directionDetailInfoResponse: directionsInfoResponse.directionB))
        
        return directionsInfo
    }
    
    private static func converte(directionDetailInfoResponse: DirectionDetailInfoResponse) -> DirectionDetailInfo {
        let directionDetailInfo = DirectionDetailInfo(
            firstStop: directionDetailInfoResponse.firstStop,
            lastStop: directionDetailInfoResponse.lastStop,
            length: directionDetailInfoResponse.length)
        
        return directionDetailInfo
    }
    
    private static func converte(transportsOnEndStopResponse: TransportsOnEndStopResponse?) -> TransportsOnEndStop? {
        guard let transportsOnEndStopResponse = transportsOnEndStopResponse else { return nil }
        
        let transportsOnEndStop = TransportsOnEndStop(
            directionA: converte(transportsResponse: transportsOnEndStopResponse.directionA),
            directionB: converte(transportsResponse: transportsOnEndStopResponse.directionB))
        
        return transportsOnEndStop
    }
    
    private static func converte(transportsResponse: [TransportResponse]?) -> [Transport]? {
        guard let transportsResponse = transportsResponse else { return nil }
        
        var transports = [Transport]()
        for transportResponse in transportsResponse {
            let transport = converte(transportResponse: transportResponse)
            transports.append(transport)
        }
        
        return transports
    }
    
    private static func converte(marcheLinesResponse: MarcheLinesResponse) -> MarcheLines {
        let marcheLines = MarcheLines(
            directionA: converte(marcheLineObjectsResponse: marcheLinesResponse.directionA),
            directionB: converte(marcheLineObjectsResponse: marcheLinesResponse.directionB))
        
        return marcheLines
    }
    
    private static func converte(marcheLineObjectsResponse: [MarcheLineObjectResponse]) -> [MarcheLineObject] {
        var marcheLineObjects = [MarcheLineObject]()
        
        for marcheLineObjectResponse in marcheLineObjectsResponse {
            let marcheLineObject: MarcheLineObject
            
            switch marcheLineObjectResponse {
            case .transport(let transportResponse):
                let transport = converte(transportResponse: transportResponse)
                marcheLineObject = .transport(transport)
            case .stop(let stopResponse):
                let stop = converte(stopResponse: stopResponse)
                marcheLineObject = .stop(stop)
            default:
                marcheLineObject = .unsupported
            }
            
            marcheLineObjects.append(marcheLineObject)
        }
        
        return marcheLineObjects
    }
    
    private static func converte(transportResponse: TransportResponse) -> Transport {
        let transport = Transport(
            dgt: transportResponse.dgt,
            id: transportResponse.transportId,
            number: transportResponse.transportNumber,
            model: transportResponse.transportModel,
            image: transportResponse.transportImage,
            comment: transportResponse.transportComment,
            action: transportResponse.transportAction,
            marks: transportResponse.transportMarks,
            style: transportResponse.transportStyle,
            diff: transportResponse.transportDiff)
        
        return transport
    }
    
    private static func converte(stopResponse: StopResponse) -> Stop {
        let stop = Stop(
            dgt: stopResponse.dgt,
            registrationNumber: stopResponse.stopRegistrationNumber,
            title: stopResponse.stopTitle,
            arrive: stopResponse.stopArrive)
        
        return stop
    }
    
}
