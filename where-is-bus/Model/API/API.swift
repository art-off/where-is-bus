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
        let stringUrl = "\(adress)/informing/wap/marsh/?action=getListRoute"
        let stringCodeUrl = URLCoder.code(url: stringUrl)
        
        return URL(string: stringCodeUrl)!
    }
    
    static func marcheFor(marcheTitle: String) -> URL {
        let stringUrl = "\(adress)/informing/wap/marsh/?m=\(marcheTitle)&action=getMarshData"
        let stringCodeUrl = URLCoder.code(url: stringUrl)
        
        return URL(string: stringCodeUrl)!
    }
    
    static func image(name: String) -> URL {
        let stringUrl = "\(adress)/informing/wap/marsh/img/\(name)"
        let stringCodeUrl = URLCoder.code(url: stringUrl)
        
        return URL(string: stringCodeUrl)!
    }
    
}
