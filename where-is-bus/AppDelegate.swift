//
//  AppDelegate.swift
//  where-is-bus
//
//  Created by art-off on 29.09.2020.
//  Copyright © 2020 art-off. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        URLSession.shared.dataTask(with: API.threeMarches()) { data, response, error in
//            guard let data = data else { return }
//            do {
//                let marchesResponse = try JSONDecoder().decode(ThreeMarchesResponse.self, from: data)
//                let marches = ResponseConverter.converte(marchesResponse: marchesResponse)
//                dump(marches)
//            } catch let jsonError {
//                print(jsonError)
//            }
//        }.resume()
        
        let apiManager = ApiManager()
        
        apiManager.loadThreeMarches { optionalThreeMarches in
            guard let threeMarches = optionalThreeMarches else {
                print("ХУИТА")
                return
            }
            
            dump(threeMarches)
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

