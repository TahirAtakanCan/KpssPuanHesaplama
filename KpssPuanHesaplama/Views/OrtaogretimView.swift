//
//  OrtaogretimView.swift
//  KpssPuanHesaplama
//
//  Created by Tahir Atakan Can on 10.07.2024.
//

import SwiftUI

struct OrtaogretimView: View {
    
    @State private var gkDogruSayisi = 30
    @State private var gkYanlisSayisi = 0
    
    @State private var gyDogruSayisi = 30
    @State private var gyYanlisSayisi = 0
    
    
    var body: some View {
        VStack {
            
            Form {
                Section {
                    Stepper("Doğru Sayısı: \(gkDogruSayisi)", value: $gkDogruSayisi, in: 1...60)
                    Stepper("Yanlış Sayısı: \(gkYanlisSayisi)", value: $gkYanlisSayisi, in: 1...60)
                    
                } header: {
                    Text("Genel Kültür")
                        .textCase(.none)
                }
                
                
            }
            
        }
        .navigationTitle("Ortaöğretim")
    }
}

#Preview {
    OrtaogretimView()
}
