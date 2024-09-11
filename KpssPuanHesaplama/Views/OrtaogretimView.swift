//
//  OrtaogretimView.swift
//  KpssPuanHesaplama
//
//  Created by Tahir Atakan Can on 10.07.2024.
//

import SwiftUI
import SwiftData

struct OrtaogretimView: View {
    
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
                    Stepper(value: $gyDogruSayisi, in: 0...60) {
                        Label("Doğru Sayısı: \(gyDogruSayisi, specifier: "%.0f")", systemImage: "checkmark.circle")
                    }
                    Stepper(value: $gyYanlisSayisi, in: 0...60) {
                        Label("Yanlış Sayısı: \(gyYanlisSayisi, specifier: "%.0f")", systemImage: "xmark.circle")
                    }
                } header: {
                    Text("Genel Yetenek")
                } footer: {
                    if gyDogruSayisi + gyYanlisSayisi > 60 {
                        Text("Toplam doğru ve yanlış sayıları 60'ı geçemez.")
                            .foregroundColor(.red)
                    }
                }
                
                Section {
                    Stepper(value: $gkDogruSayisi, in: 0...60) {
                        Label("Doğru Sayısı: \(gkDogruSayisi, specifier: "%.0f")", systemImage: "checkmark.circle")
                    }
                    Stepper(value: $gkYanlisSayisi, in: 0...60) {
                        Label("Yanlış Sayısı: \(gkYanlisSayisi, specifier: "%.0f")", systemImage: "xmark.circle")
                    }
                } header: {
                    Text("Genel Kültür")
                } footer: {
                    if gkDogruSayisi + gkYanlisSayisi > 60 {
                        Text("Toplam doğru ve yanlış sayıları 60'ı geçemez.")
                            .foregroundColor(.red)
                    }
                }
                
                Section {
                    Text("KPSS Puanı: \(sonuc, specifier: "%.3f")")
                        .bold()
                    
                    HesaplaButton(title: "Hesapla"){
                        let gkNet = gkDogruSayisi - (gkYanlisSayisi / 4)
                        let gyNet = gyDogruSayisi - (gyYanlisSayisi / 4)
                        
                        withAnimation {
                            sonuc = Constants.ortaogretimPuan + gyNet * Constants.ortaogretimGYKatsayi + gkNet * Constants.ortaogretimGKKatsayi
                        }
                        
                        let result = Result(sinavAdi: "2022 Ortaöğretim KPSS", gyNet: gyNet, gkNet: gkNet, sonuc: sonuc)
                        modelContext.insert(result)
                    }
                } header: {
                    Text("Sonuç")
                }
                
            }
            
        }
        .navigationTitle("Ortaöğretim")
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
    OrtaogretimView()
}
