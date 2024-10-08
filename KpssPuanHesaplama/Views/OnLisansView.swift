//
//  OnLisansView.swift
//  KpssPuanHesaplama
//
//  Created by Tahir Atakan Can on 10.07.2024.
//

import SwiftUI
import SwiftData

struct OnLisansView: View {
    
    @Environment(\.modelContext) private var modelContext
    
    @State private var gyDogruSayisi:Double = 30
    @State private var gyYanlisSayisi:Double = 0
    
    @State private var gkDogruSayisi:Double = 30
    @State private var gkYanlisSayisi:Double = 0
    
    @State private var sonuc:Double = 0
    
    var body: some View {
        VStack {
            
            Form {
                
                Section {
                    Stepper(value: $gyDogruSayisi, in: 1...60){
                        Label("Doğru Sayısı: \(gyDogruSayisi, specifier: "%.0f")", systemImage: "checkmark.circle")
                    }
                        .sensoryFeedback(.selection, trigger: gyDogruSayisi)
                        .bold()
                    Stepper(value: $gyYanlisSayisi, in: 1...60){
                        Label("Yanlış Sayısı: \(gyYanlisSayisi, specifier: "%.0f")", systemImage: "xmark.circle")
                    }
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
                    Stepper(value: $gkDogruSayisi, in: 1...60){
                        Label("Doğru Sayısı: \(gkDogruSayisi, specifier: "%.0f")", systemImage: "checkmark.circle")
                    }
                        .sensoryFeedback(.selection, trigger: gkDogruSayisi)
                        .bold()
                    Stepper(value: $gkYanlisSayisi, in: 1...60){
                        Label("Yanlış Sayısı: \(gkYanlisSayisi, specifier: "%.0f")", systemImage: "xmark.circle")
                    }
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
                    Text("KPSS Puanı: \(sonuc, specifier: "%.3f")")
                        .bold()
                        //.transition(.slide)
                        //.animation(.default, value: sonuc)
                    
                    HesaplaButton(title: "Hesapla") {
                        
                        let gkNet = gkDogruSayisi - (gkYanlisSayisi / 4)
                        let gyNet = gyDogruSayisi - (gyYanlisSayisi / 4)
                        
                        withAnimation {
                            sonuc = Constants.onlisansPuan + gyNet * Constants.onlisansGYKatsayi + gkNet * Constants.onlisansGKKatsayi
                        }
                        
                        let result = Result(sinavAdi: "2022 Önlisans KPSS", gyNet: gyNet, gkNet: gkNet, sonuc: sonuc)
                        modelContext.insert(result)
                    }
                    //.disabled(formKontrol)
                    .sensoryFeedback(.success, trigger: sonuc)
                    } header: {
                    Text("Sonuç")
                        .textCase(.none)
                        .foregroundStyle(.main)
                }
                
                
            }
            
        }
        .navigationTitle("OnLisans")
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
   OnLisansView()
}

