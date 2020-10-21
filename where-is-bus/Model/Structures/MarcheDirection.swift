//
//  MarcheDirection.swift
//  where-is-bus
//
//  Created by art-off on 21.10.2020.
//  Copyright © 2020 art-off. All rights reserved.
//

import Foundation

struct MarcheDirection {
    
    // Поля, которые есть в обоих направлениях
    let typeId: Int
    let typeTitle: String
    let title: String
    let forecastTime: String
    
    let directionInfo: DirectionDetailInfo
    let transportsOnEndStop: [Transport]
    let marcheLine: [MarcheLineObject]
    
    enum DirectionType {
        case directionA
        case directionB
    }
    
    init(marche: Marche, by directionType: DirectionType) {
        self.typeId = marche.typeId
        self.typeTitle = marche.typeTitle
        self.title = marche.title
        self.forecastTime = marche.forecastTime
        
        switch directionType {
        case .directionA:
            self.directionInfo = marche.directionsInfo.directionA
            if let toes = marche.transportsOnEndStop?.directionA {
                transportsOnEndStop = toes
            } else {
                transportsOnEndStop = []
            }
            self.marcheLine = marche.marcheLines.directionA
        case .directionB:
            self.directionInfo = marche.directionsInfo.directionB
            if let toes = marche.transportsOnEndStop?.directionB {
                transportsOnEndStop = toes
            } else {
                transportsOnEndStop = []
            }
            self.marcheLine = marche.marcheLines.directionB
        }
    }
    
}
