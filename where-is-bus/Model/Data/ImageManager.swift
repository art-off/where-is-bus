//
//  ImageManager.swift
//  where-is-bus
//
//  Created by art-off on 22.10.2020.
//  Copyright © 2020 art-off. All rights reserved.
//

import Foundation
import UIKit

class ImageManager {
    
    static let shared = ImageManager()
    
    // MARK: - Private properties
    private let filesDirectory: URL
    
    
    // MARK: - Initialization
    init() {
        let fileManager = FileManager.default
        
        // Создаем директорию проекта в Documents
        let projectDirectoryURL = try! fileManager
            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("where-is-bus")
        
        if !fileManager.fileExists(atPath: projectDirectoryURL.path) {
            do {
                try fileManager.createDirectory(at: projectDirectoryURL, withIntermediateDirectories: true, attributes: nil)
            } catch let createError {
                NSLog("Create Directory | \(createError)")
            }
        }
        
        // Создаем директорию для иконок транспорта
        filesDirectory = projectDirectoryURL
            .appendingPathComponent("transport-icons")
        
        if !fileManager.fileExists(atPath: filesDirectory.path) {
            do {
                try fileManager.createDirectory(at: filesDirectory, withIntermediateDirectories: true, attributes: nil)
            } catch let createError {
                NSLog("Create Directory | \(createError)")
            }
        }
    }
    
    // MARK: - Methods
//    func image(with name: String) -> UIImage? {
//        
//    }
    
}
