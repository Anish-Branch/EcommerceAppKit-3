//
//  EcommerceAppKitApp.swift
//  Shared
//
//  Created by Balaji on 26/11/21.
//

import SwiftUI
import BranchSDK

@main
struct EcommerceAppKitApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL(perform: { url in
                                    Branch.getInstance().handleDeepLink(url)
                                })
        }
    }
}

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        
        Branch.getInstance().enableLogging()
        
        Branch.getInstance().initSession(launchOptions: launchOptions) { (params, error) in
            // do stuff with deep link data (nav to page, display content, etc)
            print(params as? [String: AnyObject] ?? {})
        }
        
        return true
    }
    
}
