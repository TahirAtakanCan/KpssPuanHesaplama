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
                    Stepper(value: $gyDogruSayisi, in: 0...(60 - gyYanlisSayisi)) {
                        Label("Doğru Sayısı: \(gyDogruSayisi, specifier: "%.0f")", systemImage: "checkmark.circle")
                    }
                    .sensoryFeedback(.selection, trigger: gyDogruSayisi)
                    .bold()
                    
                    Stepper(value: $gyYanlisSayisi, in: 0...(60 - gyDogruSayisi)) {
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
                    Stepper(value: $gkDogruSayisi, in: 0...(60 - gkYanlisSayisi)) {
                        Label("Doğru Sayısı: \(gkDogruSayisi, specifier: "%.0f")", systemImage: "checkmark.circle")
                    }
                    .sensoryFeedback(.selection, trigger: gkDogruSayisi)
                    .bold()

                    Stepper(value: $gkYanlisSayisi, in: 0...(60 - gkDogruSayisi)) {
                        Label("Yanlış Sayısı: \(gkYanlisSayisi, specifier: "%.0f")", systemImage: "xmark.circle")
                    }
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
                    Stepper(value: $ebDogruSayisi, in: 0...(80 - ebYanlisSayisi)){
                        Label("Doğru Sayısı: \(ebDogruSayisi, specifier: "%.0f")", systemImage: "checkmark.circle")
                    }
                        .sensoryFeedback(.selection, trigger: ebDogruSayisi)
                        .bold()
                    Stepper(value: $ebYanlisSayisi, in: 0...(80 - ebDogruSayisi)){
                        Label("Yanlış Sayısı: \(ebYanlisSayisi, specifier: "%.0f")", systemImage: "xmark.circle")
                    }
                        .sensoryFeedback(.selection, trigger: ebYanlisSayisi)
                        .bold()
                    
                    HesaplaButton(title: "Hesapla") {
                        
                        let gkNet = gkDogruSayisi - (gkYanlisSayisi / 4)
                        let gyNet = gyDogruSayisi - (gyYanlisSayisi / 4)
                        let ebNet = ebDogruSayisi - (ebYanlisSayisi / 4)
                        
                        withAnimation {
                            sonucEB2022   = Constants.eb2022Puan + gyNet * Constants.eb2022GYKatsayi + gkNet * Constants.eb2022GKKatsayi + ebNet * Constants.eb2022Katsayi
                            sonuc2022     = Constants.lisans2022Puan + gyNet * Constants.lisans2022GYKatsayi + gkNet * Constants.lisans2022GKKatsayi
                            sonucEB2023   = Constants.eb2023Puan + gyNet * Constants.eb2023GYKatsayi + gkNet * Constants.eb2023GKKatsayi + ebNet * Constants.eb2023Katsayi
                            sonuc2023     = Constants.lisans2023Puan + gyNet * Constants.lisans2023GYKatsayi + gkNet * Constants.lisans2023GKKatsayi
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
        .toolbar(.hidden, for: .tabBar)
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
