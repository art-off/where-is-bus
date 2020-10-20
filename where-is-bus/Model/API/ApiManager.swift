//
//  ApiManager.swift
//  where-is-bus
//
//  Created by art-off on 05.10.2020.
//  Copyright © 2020 art-off. All rights reserved.
//

import Foundation

class ApiManager {
    
    // MARK: - Privates properties
    private let downloadingQueue: OperationQueue = {
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 2
        return queue
    }()
    
    private let session = URLSession(configuration: URLSessionConfiguration.default)
    
    // MARK: - Cancel All Downloading
    func cancelAllDownloading() {
        downloadingQueue.cancelAllOperations()
    }
    
    // MARK: - Methods to downloading
    func loadThreeMarches(completion: @escaping (_: ThreeMarches?) -> Void) {
        var downloadedThreeMarches: ThreeMarches?
        
        let completionOperation = BlockOperation {
            completion(downloadedThreeMarches)
        }
        
        let threeMarchesDownloadingOperation = DownloadOperation(session: session, url: API.threeMarches()) { data, response, error in
            guard let threeMarches = ResponseHandler.handleThreeMarches(data, response, error) else {
                NSLog("Api Manager Load Three Marches | threeMarhces is Nil")
                completion(nil)
                self.downloadingQueue.cancelAllOperations()
                return
            }
            downloadedThreeMarches = threeMarches
        }
        
        completionOperation.addDependency(threeMarchesDownloadingOperation)
        
        downloadingQueue.addOperation(threeMarchesDownloadingOperation)
        downloadingQueue.addOperation(completionOperation)
    }
    
    func loadMarche(for marcheTitle: String, completion: @escaping (_: Marche?) -> Void) {
        let url = API.marcheFor(marcheTitle: marcheTitle)
        print(url)
        
        var downloadedMarche: Marche?
        
        let completionOperation = BlockOperation {
            completion(downloadedMarche)
        }
        
        let marcheDownloadingOperation = DownloadOperation(session: session, url: url) { data, response, error in
            guard let marche = ResponseHandler.handleMarche(data, response, error) else {
                NSLog("Api Manager Load Marche | marche is Nil")
                completion(nil)
                self.downloadingQueue.cancelAllOperations()
                return
            }
            downloadedMarche = marche
        }
        
        completionOperation.addDependency(marcheDownloadingOperation)
        
        downloadingQueue.addOperation(marcheDownloadingOperation)
        downloadingQueue.addOperation(completionOperation)
    }
    
}
