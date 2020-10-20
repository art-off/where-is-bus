//
//  String+firstMatch.swift
//  where-is-bus
//
//  Created by art-off on 16.10.2020.
//  Copyright © 2020 art-off. All rights reserved.
//

import Foundation

extension String {
    
    func firstMarch(with pattern: String) -> String? {
        guard let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive) else { return nil }
        guard let matche = regex.firstMatch(in: self, range: NSRange(0..<self.utf16.count)) else { return nil }
        
        guard let range = Range(matche.range, in: self) else { return nil }
        
        let matchingString = String(self[range])
        return matchingString
    }
    
}
