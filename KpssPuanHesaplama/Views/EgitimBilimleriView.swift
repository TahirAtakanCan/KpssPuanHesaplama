//
//  EgitimBilimleriView.swift
//  KpssPuanHesaplama
//
//  Created by Tahir Atakan Can on 10.07.2024.
//

import SwiftUI

struct EgitimBilimleriView: View {
    
    @State private var gyDogruSayisi:Double = 30
    @State private var gyYanlisSayisi:Double = 0
    
    @State private var gkDogruSayisi:Double = 30
    @State private var gkYanlisSayisi:Double = 0
    
    @State private var ebDogruSayisi:Double = 40
    @State private var ebYanlisSayisi:Double = 0
    
    @State private var sonuc2022:Double = 0
    @State private var sonucEB2022:Double = 0
    @State private var sonuc2023:Double = 0
    @State private var sonucEB2023:Double = 0
    
    @State private var isShowingSheet = false
    
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
                        .foregroundColor(.main)
                } footer: {
                    if(gkDogruSayisi + gkYanlisSayisi > 60) {
                        Text("Toplam doğru ve yanlış sayıları 60'ı geçemez.")
                            .foregroundStyle(.red)
                    }
                }
                
                Section {
                    Stepper("Doğru Sayısı: \(ebDogruSayisi, specifier: "%.0f")", value: $ebDogruSayisi, in: 0...(80 - ebYanlisSayisi))
                        .sensoryFeedback(.selection, trigger: ebDogruSayisi)
                        .bold()
                    Stepper("Yanlış Sayısı: \(ebYanlisSayisi, specifier: "%.0f")", value: $ebYanlisSayisi, in: 0...(80 - ebDogruSayisi))
                        .sensoryFeedback(.selection, trigger: ebYanlisSayisi)
                        .bold()
                    
                    HesaplaButton(title: "Hesapla") {
                        
                        let gkNet = gkDogruSayisi - (gkYanlisSayisi / 4)
                        let gyNet = gyDogruSayisi - (gyYanlisSayisi / 4)
                        let ebNet = ebDogruSayisi - (ebYanlisSayisi / 4)
                        
                        withAnimation {
                            sonucEB2022 = (36.812 + gyNet * 0.3985 + gkNet * 0.3512 + ebNet * 0.34714)
                            sonuc2022 = (48.616 + gyNet * 0.4756 + gkNet * 0.4192)
                            
                            sonucEB2023 = (40.405 + gyNet * 0.3493 + gkNet * 0.3672 + ebNet * 0.37145)
                            sonuc2023 = (51.209 + gyNet * 0.537 + gkNet * 0.418)
                        }
                        isShowingSheet.toggle()
                    }
                    //.disabled(formKontrol)
                    .sensoryFeedback(.success, trigger: sonuc2022)
                    .sheet(isPresented: $isShowingSheet) {
                        SonucView(sonuc2022: sonuc2022, sonucEB2022: sonucEB2022, sonucOABT2022: nil, sonuc2023: sonuc2023, sonucEB2023: sonucEB2023, sonucOABT2023: nil)
                    }
                    
                } header: {
                    Text("Eğitim Bilimleri")
                        .textCase(.none)
                        .foregroundColor(.main)
                } footer: {
                    if(ebDogruSayisi + ebYanlisSayisi > 80) {
                        Text("Toplam doğru ve yanlış sayıları 80'ı geçemez.")
                            .foregroundStyle(.red)
                    }
                }
                
            }
            
        }
        .navigationTitle("Egitim Bilimleri")
    }
    
    var formKontrol: Bool {
        if((gyDogruSayisi + gyYanlisSayisi) > 60 || (gkDogruSayisi + gkYanlisSayisi) > 60 || (ebDogruSayisi + ebYanlisSayisi) > 80) {
            return true
        }
        return false
    }
}

#Preview {
   EgitimBilimleriView()
}
