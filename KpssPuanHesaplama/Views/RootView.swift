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
        ZStack {
            
            if selectionItem != 2 {
                TabView(selection: $selectionItem) {
                    MainView()
                        .tabItem {
                            Label("Başlangıç", systemImage: "house")
                        }
                        .tag(0)
                    
                    ResultView(selectionTabItem: $selectionItem)
                        .tabItem {
                            Label("Hesaplamalar", systemImage: "arrow.counterclockwise.circle")
                        }
                        .tag(1)
                    
                    TargetView(selectionTabItem: $selectionItem)
                        .tabItem {
                            Label("Hedef", systemImage: "target")
                        }
                        .tag(2)
                }
                .fullScreenCover(isPresented: $showingOnboarding, content: {
                    OnboardingView()
                        .ignoresSafeArea(.all)
                        .onDisappear {
                            showingOnboarding = false
                            ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in })
                        }
                })
                .tint(.main)
                .accentColor(.main)
            }
            
            // When TargetView is selected, remove TabBar and show only the content
            if selectionItem == 2 {
                TargetView(selectionTabItem: $selectionItem)
            }
        }
    }
}



#Preview {
    RootView()
}
