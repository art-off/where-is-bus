//
//  MarcheLinesResponse.swift
//  where-is-bus
//
//  Created by art-off on 11.10.2020.
//  Copyright © 2020 art-off. All rights reserved.
//

import Foundation

class MarcheLinesResponse: Decodable {

    let directionA: [MarcheLineObjectResponse]
    let directionB: [MarcheLineObjectResponse]

    enum CodingKeys: String, CodingKey {
        case directionA = "A"
        case directionB = "B"
    }

}

enum MarcheLineObjectResponse {
    
    case transport(TransportResponse)
    case stop(StopResponse)
    case unsupported
    
}

extension MarcheLineObjectResponse: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case object = "obj"
        case dgt
        
        // Автобусные поля
        case transportId = "ts_id"
        case transportNumber = "ts_numb"
        case transportModel = "ts_model"
        case transportImage = "ts_img"
        case transportComment = "ts_coment"
        case transportAction = "ts_action"
        case transportMarks = "ts_marks"
        case transportStyle = "ts_style"
        case transportDiff = "ts_diff"
        
        // Поля остановки
        case stopRegistrationNumber = "st_regnum"
        case stopTitle = "st_title"
        case stopArrive = "st_arrive"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let type = try container.decode(String.self, forKey: .object)
        
        switch type {
        case "ts":
            let dgt = try container.decode(Int.self, forKey: .dgt)
            let transportId = try container.decode(Int.self, forKey: .transportId)
            let transportNumber = try container.decode(String.self, forKey: .transportNumber)
            let transportModel = try container.decode(String.self, forKey: .transportModel)
            let transportImage = try container.decode(String.self, forKey: .transportImage)
            let transportComment = try container.decode(String.self, forKey: .transportComment)
            let transportAction = try container.decode(String.self, forKey: .transportAction)
            let transportMarks = try container.decode(String.self, forKey: .transportMarks)
            let transportStyle = try container.decode(String.self, forKey: .transportStyle)
            let transportDiff = try? container.decode(String.self, forKey: .transportDiff)
            
            let transport = TransportResponse(
                dgt: dgt, id: transportId, number: transportNumber, model: transportModel, image: transportImage,
                comment: transportComment, action: transportAction, marks: transportMarks, style: transportStyle, diff: transportDiff)
            self = .transport(transport)
        case "stop":
            let dgt = try container.decode(Int.self, forKey: .dgt)
            let stopRegistrationNumber = try container.decode(Int.self, forKey: .stopRegistrationNumber)
            let stopTitle = try container.decode(String.self, forKey: .stopTitle)
            let stopArrive = try container.decode(String.self, forKey: .stopArrive)
            
            let stop = StopResponse(
                dgt: dgt, registrationNumber: stopRegistrationNumber, title: stopTitle, arrive: stopArrive)
            self = .stop(stop)
        default:
            self = .unsupported
        }
    }
    
}
