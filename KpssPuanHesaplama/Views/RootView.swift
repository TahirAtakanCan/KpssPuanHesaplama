//
//  RootView.swift
//  KpssPuanHesaplama
//
//  Created by Tahir Atakan Can on 10.07.2024.
//

import SwiftUI
import AppTrackingTransparency

struct RootView: View {
    @State private var selectionItem = 0
    @AppStorage("$showingOnboarding") private var showingOnboarding = true
    
    var body: some View {
        TabView(selection: $selectionItem){
            MainView()
                .tabItem {
                    Label("Başlangıç", systemImage: "house")
                        .environment(\.symbolVariants, selectionItem == 0 ? .fill: .none)
                }
                .tag(0)
            
            ResultView(selectionTabItem: $selectionItem)
                .tabItem {
                    Label("Hesaplamalar", systemImage: "arrow.counterclockwise.circle")
                        .environment(\.symbolVariants, selectionItem == 1 ? .fill: .none)
                }
                .tag(1)
            TargetView()
                .tabItem {
                    Label("Hedefleriniz", systemImage: "target")
                        .environment(\.symbolVariants, selectionItem == 2 ? .fill: .none)
                }
                .tag(2)
        }
        .fullScreenCover(isPresented: $showingOnboarding, content: {
            OnboardingView.init()
                .ignoresSafeArea(.all)
                .onDisappear{
                    showingOnboarding = false
                    ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in})
                }
        })
        
        .tint(.main)
    }
}

#Preview {
    RootView()
}
