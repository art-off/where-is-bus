//
//  URLCoder.swift
//  where-is-bus
//
//  Created by art-off on 16.10.2020.
//  Copyright © 2020 art-off. All rights reserved.
//

import Foundation

class URLCoder {
    
    static func code(url: String) -> String {
        var codeUrl = String()
        
        for char in url {
            let lowercasedChar = char.lowercased()
            if codeDictionary.keys.contains(lowercasedChar) {
                codeUrl += codeDictionary[lowercasedChar]!
            } else {
                codeUrl.append(char)
            }
        }
        
        return codeUrl
    }
    
    private static let codeDictionary: [String: String] = [
        "а": "%E0",
        "б": "%E1",
        "в": "%E2",
        "г": "%E3",
        "д": "%E4",
        "е": "%E5",
        "ж": "%E6",
        "з": "%E7",
        "и": "%E8",
        "й": "%E9",
        "к": "%EA",
        "л": "%EB",
        "м": "%EC",
        "н": "%ED",
        "о": "%EE",
        "п": "%EF",
        "р": "%F0",
        "с": "%F1",
        "т": "%F2",
        "у": "%F3",
        "ф": "%F4",
        "х": "%F5",
        "ц": "%F6",
        "ч": "%F7",
        "ш": "%F8",
        "щ": "%F9",
        "ъ": "%FA",
        "ы": "%FB",
        "ь": "%FC",
        "э": "%FD",
        "ю": "%FE",
        "я": "%FF"
    ]
    
}
