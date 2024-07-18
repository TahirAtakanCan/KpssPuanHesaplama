//
//  OrtaogretimView.swift
//  KpssPuanHesaplama
//
//  Created by Tahir Atakan Can on 10.07.2024.
//

import SwiftUI

struct OrtaogretimView: View {
    
    @State private var gyDogruSayisi:Double = 30
    @State private var gyYanlisSayisi:Double = 0
    
    @State private var gkDogruSayisi:Double = 30
    @State private var gkYanlisSayisi:Double = 0
    
    @State private var sonuc:Double = 0
    
    var body: some View {
        VStack {
            
            Form {
                
                Section {
                    Stepper("Doğru Sayısı: \(gyDogruSayisi, specifier: "%.0f")", value: $gyDogruSayisi, in: 0...(60 - gyYanlisSayisi))
                        .sensoryFeedback(.selection, trigger: gyDogruSayisi)
                    Stepper("Yanlış Sayısı: \(gyYanlisSayisi, specifier: "%.0f")", value: $gyYanlisSayisi, in: 0...(60 - gyDogruSayisi))
                        .sensoryFeedback(.selection, trigger: gyYanlisSayisi)
                    
                } header: {
                    Text("Genel Yetenek")
                        .textCase(.none)
                } footer: {
                    if(gyDogruSayisi + gyYanlisSayisi > 60) {
                        Text("Toplam doğru ve yanlış sayıları 60'ı geçemez.")
                            .foregroundStyle(.red)
                    }
                }
                
                
                Section {
                    Stepper("Doğru Sayısı: \(gkDogruSayisi, specifier: "%.0f")", value: $gkDogruSayisi, in: 0...(60 - gkYanlisSayisi))
                        .sensoryFeedback(.selection, trigger: gkDogruSayisi)
                    Stepper("Yanlış Sayısı: \(gkYanlisSayisi, specifier: "%.0f")", value: $gkYanlisSayisi, in: 0...(60 - gkDogruSayisi))
                        .sensoryFeedback(.selection, trigger: gkYanlisSayisi)
                    
                } header: {
                    Text("Genel Kültür")
                        .textCase(.none)
                } footer: {
                    if(gkDogruSayisi + gkYanlisSayisi > 60) {
                        Text("Toplam doğru ve yanlış sayıları 60'ı geçemez.")
                            .foregroundStyle(.red)
                    }
                }
                
                Section {
                    Text("KPSS Puanı: \(sonuc, specifier: "%.3f")")
                    
                    HesaplaButton(title: "Hesapla") {
                        
                        let gkNet = gkDogruSayisi - (gkYanlisSayisi / 4)
                        let gyNet = gyDogruSayisi - (gyYanlisSayisi / 4)
                        
                        sonuc = 55.839 + gyNet * 0.348 + gkNet * 0.431
                        
                        //print("Hesaplama İşlemleri")
                    }
                    //.disabled(formKontrol)
                    
                    } header: {
                    Text("Sonuç")
                        .textCase(.none)
                }
                
                
            }
            
        }
        .navigationTitle("Ortaöğretim")
    }
    
    var formKontrol: Bool {
        if((gyDogruSayisi + gyYanlisSayisi) > 60 || (gkDogruSayisi + gkYanlisSayisi) > 60) {
            return true
        }
        return false
    }
}

#Preview {
    OrtaogretimView()
}
