//
//  KpssPuanHesaplamaApp.swift
//  KpssPuanHesaplama
//
//  Created by Tahir Atakan Can on 10.07.2024.
//

import SwiftUI
import SwiftData
import GoogleMobileAds

@main
struct KpssPuanHesaplamaApp: App {
    
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
