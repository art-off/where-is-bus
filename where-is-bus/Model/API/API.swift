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
    
    static func marcheFor(marchNumber: Int, for type: TransportType) -> URL {
        let marchTitle: String
        switch type {
        case .bus:
            marchTitle = "\(marchNumber)"
        case .trolleybus:
            marchTitle = "\(marchNumber)%F2"
        case .trams:
            marchTitle = "\(marchNumber)%F2%F0"
        }
        
        return URL(string: "\(adress)/informing/wap/marsh/?m=\(marchTitle)&action=getMarshData")!
    }
    
}
