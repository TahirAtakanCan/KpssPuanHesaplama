//
//  LisansView.swift
//  KpssPuanHesaplama
//
//  Created by Tahir Atakan Can on 10.07.2024.
//

import SwiftUI

struct LisansView: View {
    
    @State private var gyDogruSayisi:Double = 30
    @State private var gyYanlisSayisi:Double = 0
    
    @State private var gkDogruSayisi:Double = 30
    @State private var gkYanlisSayisi:Double = 0
    
    @State private var sonuc2022:Double = 0
    @State private var sonuc2023:Double = 0
    
    var body: some View {
        VStack {
            
            Form {
                
                Section {
                    Stepper("Doğru Sayısı: \(gyDogruSayisi, specifier: "%.0f")", value: $gyDogruSayisi, in: 0...(60 - gyYanlisSayisi))
                        .sensoryFeedback(.selection, trigger: gyDogruSayisi)
                        .bold()
                    Stepper("Yanlış Sayısı: \(gyYanlisSayisi, specifier: "%.0f")", value: $gyYanlisSayisi, in: 0...(60 - gyDogruSayisi))
                        .sensoryFeedback(.selection, trigger: gyYanlisSayisi)
                        .bold()
                    
                } header: {
                    Text("Genel Yetenek")
                        .textCase(.none)
                        .foregroundStyle(.main)
                } footer: {
                    if(gyDogruSayisi + gyYanlisSayisi > 60) {
                        Text("Toplam doğru ve yanlış sayıları 60'ı geçemez.")
                            .foregroundStyle(.red)
                    }
                }
                
                
                Section {
                    Stepper("Doğru Sayısı: \(gkDogruSayisi, specifier: "%.0f")", value: $gkDogruSayisi, in: 0...(60 - gkYanlisSayisi))
                        .sensoryFeedback(.selection, trigger: gkDogruSayisi)
                        .bold()
                    Stepper("Yanlış Sayısı: \(gkYanlisSayisi, specifier: "%.0f")", value: $gkYanlisSayisi, in: 0...(60 - gkDogruSayisi))
                        .sensoryFeedback(.selection, trigger: gkYanlisSayisi)
                        .bold()
                    
                } header: {
                    Text("Genel Kültür")
                        .textCase(.none)
                        .foregroundStyle(.main)
                } footer: {
                    if(gkDogruSayisi + gkYanlisSayisi > 60) {
                        Text("Toplam doğru ve yanlış sayıları 60'ı geçemez.")
                            .foregroundStyle(.red)
                    }
                }
                
                Section {
                    Text("2023 KPSS Puanı: \(sonuc2023, specifier: "%.3f")")
                        .bold()
                    Text("2022 KPSS Puanı: \(sonuc2022, specifier: "%.3f")")
                        .bold()
                        //.transition(.slide)
                        //.animation(.default, value: sonuc)
                    
                    HesaplaButton(title: "Hesapla") {
                        
                        let gkNet = gkDogruSayisi - (gkYanlisSayisi / 4)
                        let gyNet = gyDogruSayisi - (gyYanlisSayisi / 4)
                        
                        withAnimation {
                            sonuc2023 = 51.209 + gyNet * 0.537 + gkNet * 0.418
                            sonuc2022 = 48.616 + gyNet * 0.4756 + gkNet * 0.4192
                        }
                        
                    }
                    //.disabled(formKontrol)
                    .sensoryFeedback(.success, trigger: sonuc2022)
                    } header: {
                    Text("Sonuç")
                        .textCase(.none)
                        .foregroundStyle(.main)
                }
                
                
            }
            
        }
        .navigationTitle("Lisans")
        .toolbar(.hidden, for: .tabBar)
    }
    
    var formKontrol: Bool {
        if((gyDogruSayisi + gyYanlisSayisi) > 60 || (gkDogruSayisi + gkYanlisSayisi) > 60) {
            return true
        }
        return false
    }
}

#Preview {
    LisansView()
}

