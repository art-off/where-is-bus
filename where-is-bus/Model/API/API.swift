//
//  API.swift
//  where-is-bus
//
//  Created by art-off on 05.10.2020.
//  Copyright © 2020 art-off. All rights reserved.
//

import Foundation

struct API {
    
    private static let adress = "https://mu-kgt.ru/"
    
    static func threeMarches() -> URL {
        return URL(string: "\(adress)/informing/wap/marsh/?action=getListRoute")!
    }
    
    static func timetableFor(marchTitle: String) -> URL {
        return URL(string: "\(adress)/informing/wap/marsh/?m=\(marchTitle)&action=getMarshData")!
    }
    
}
