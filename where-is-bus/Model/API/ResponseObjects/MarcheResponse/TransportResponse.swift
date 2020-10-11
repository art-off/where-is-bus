//
//  TransportResponse.swift
//  where-is-bus
//
//  Created by art-off on 11.10.2020.
//  Copyright © 2020 art-off. All rights reserved.
//

import Foundation

class TransportResponse: Decodable {
    
    let dgt: Int
    //let object: String
    
    let transportId: Int
    let transportNumber: String
    let transportModel: String
    let transportImage: String
    let transportComment: String
    let transportAction: String
    let transportMarks: String
    let transportStyle: String
    
    let transportDiff: String?
    
    enum CodingKeys: String, CodingKey {
        case dgt
        //case object = "obj"
        case transportId = "ts_id"
        case transportNumber = "ts_numb"
        case transportModel = "ts_model"
        case transportImage = "ts_img"
        case transportComment = "ts_coment"
        case transportAction = "ts_action"
        case transportMarks = "ts_marks"
        case transportStyle = "ts_style"
        case transportDiff = "ts_diff"
    }
    
    init(dgt: Int, id: Int, number: String, model: String, image: String, comment: String, action: String, marks: String, style: String, diff: String?) {
        self.dgt = dgt
        transportId = id
        transportNumber = number
        transportModel = model
        transportImage = image
        transportComment = comment
        transportAction = action
        transportMarks = marks
        transportStyle = style
        transportDiff = diff
    }
    
}
