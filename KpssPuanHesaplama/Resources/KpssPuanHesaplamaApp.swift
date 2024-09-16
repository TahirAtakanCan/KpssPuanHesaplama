//
//  KpssPuanHesaplamaApp.swift
//  KpssPuanHesaplama
//
//  Created by Tahir Atakan Can on 10.07.2024.
//

import SwiftUI
import SwiftData
import GoogleMobileAds
import FirebaseCore

@main
struct KpssPuanHesaplamaApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    init() {
        
        let appearanceNav = UINavigationBarAppearance()
        appearanceNav.configureWithOpaqueBackground()
        UINavigationBar.appearance().standardAppearance = appearanceNav
        UINavigationBar.appearance().scrollEdgeAppearance = appearanceNav
        
        let appearanceTab = UITabBarAppearance()
        appearanceTab.configureWithOpaqueBackground()
        UITabBar.appearance().scrollEdgeAppearance = appearanceTab
        UITabBar.appearance().standardAppearance = appearanceTab
        
        //AdMob SDK
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .modelContainer(for: Result.self)
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
