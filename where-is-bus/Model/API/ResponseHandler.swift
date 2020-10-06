//
//  ResponseHandler.swift
//  where-is-bus
//
//  Created by art-off on 05.10.2020.
//  Copyright © 2020 art-off. All rights reserved.
//

import Foundation

class ResponseHandler {
    
    static func handleThreeMarches(_ data: Data?, _ response: URLResponse?, _ error: Error?) -> ThreeMarches? {
        guard error == nil else {
            NSLog("Load Marches | Error")
            return nil
        }
        guard let httpResponse = response as? HTTPURLResponse else {
            NSLog("Load Marches | Response is not HTTPURLResponse")
            return nil
        }
        guard (200..<300).contains(httpResponse.statusCode) else {
            NSLog("Load Marches | Status code = \(httpResponse.statusCode)")
            return nil
        }
        guard let data = data else {
            NSLog("Load Marches | Data is nil")
            return nil
        }

        do {
            let threeMarchesResponse = try JSONDecoder().decode(ThreeMarchesResponse.self, from: data)
            let threeMarches = ResponseConverter.converte(marchesResponse: threeMarchesResponse)
            return threeMarches
        } catch let jsonError {
            NSLog("Load Marches | jsonError = \(jsonError)")
            return nil
        }
    }
    
}
