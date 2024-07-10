//
//  RootView.swift
//  KpssPuanHesaplama
//
//  Created by Tahir Atakan Can on 10.07.2024.
//

import SwiftUI

struct RootView: View {
    @State private var selectionItem = 0
    var body: some View {
        TabView(selection: $selectionItem){
            MainView()
                .tabItem {
                    Label("Başlangıç", systemImage: "house")
                }
                .tag(0)
            
            ResultView()
                .tabItem {
                    Label("Hesaplamalar", systemImage: "arrow.counterclockwise.circle")
                }
                .tag(1)
        }
    }
}

#Preview {
    RootView()
}
