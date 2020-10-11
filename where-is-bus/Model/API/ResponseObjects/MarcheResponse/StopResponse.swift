//
//  StopResponse.swift
//  where-is-bus
//
//  Created by art-off on 11.10.2020.
//  Copyright © 2020 art-off. All rights reserved.
//

import Foundation

class StopResponse: Decodable {
    
    let dgt: Int
    //let object: String
    //let stopRegistrationNumber: Int
    let stopTitle: String
    let stopArrive: String
    
    enum CodingKeys: String, CodingKey {
        case dgt
        //case object = "obj"
        //case stopRegistrationNumber = "st_regnum"
        case stopTitle = "st_title"
        case stopArrive = "st_arrive"
    }
    
    init(dgt: Int, title: String, arrive: String) {
        self.dgt = dgt
        stopTitle = title
        stopArrive = arrive
    }
    
}
