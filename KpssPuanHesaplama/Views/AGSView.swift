//
//  AGSView.swift
//  KpssPuanHesaplama
//
//  Created by Tahir Atakan Can on 6.01.2025.
//

import SwiftUI

struct AGSView: View {
    @Environment(\.modelContext) private var modelContext
    
    // Sözel Yetenek için
    @State private var sozelDogruSayisi: Double = 0
    @State private var sozelYanlisSayisi: Double = 0
    
    // Sayısal Yetenek için
    @State private var sayisalDogruSayisi: Double = 0
    @State private var sayisalYanlisSayisi: Double = 0
    
    // Tarih için
    @State private var tarihDogruSayisi: Double = 0
    @State private var tarihYanlisSayisi: Double = 0
    
    // Coğrafya için
    @State private var cografyaDogruSayisi: Double = 0
    @State private var cografyaYanlisSayisi: Double = 0
    
    // Mevzuat için
    @State private var mevzuatDogruSayisi: Double = 0
    @State private var mevzuatYanlisSayisi: Double = 0
    
    // Eğitim Temelleri için
    @State private var egitimDogruSayisi: Double = 0
    @State private var egitimYanlisSayisi: Double = 0
    
    @State private var sonuc = 0.0
    @State private var isShowingSheet = false
    
    var body: some View {
        Form {
            Section {
                Stepper(value: $sozelDogruSayisi, in: 0...(15 - sozelYanlisSayisi)) {
                    Label("Doğru Sayısı: \(sozelDogruSayisi, specifier: "%.0f")", systemImage: "checkmark.circle")
                }
                .sensoryFeedback(.selection, trigger: sozelDogruSayisi)
                .bold()
                
                Stepper(value: $sozelYanlisSayisi, in: 0...(15 - sozelDogruSayisi)) {
                    Label("Yanlış Sayısı: \(sozelYanlisSayisi, specifier: "%.0f")", systemImage: "xmark.circle")
                }
                .sensoryFeedback(.selection, trigger: sozelYanlisSayisi)
                .bold()
            } header: {
                Text("Sözel Yetenek")
            } footer: {
                if sozelDogruSayisi + sozelYanlisSayisi > 15 {
                    Text("Toplam doğru ve yanlış sayısı 15'i geçemez")
                        .foregroundStyle(.red)
                }
            }
            
            Section {
                Stepper(value: $sayisalDogruSayisi, in: 0...(15 - sayisalYanlisSayisi)) {
                    Label("Doğru Sayısı: \(sayisalDogruSayisi, specifier: "%.0f")", systemImage: "checkmark.circle")
                }
                .sensoryFeedback(.selection, trigger: sayisalDogruSayisi)
                .bold()
                
                Stepper(value: $sayisalYanlisSayisi, in: 0...(15 - sayisalDogruSayisi)) {
                    Label("Yanlış Sayısı: \(sayisalYanlisSayisi, specifier: "%.0f")", systemImage: "xmark.circle")
                }
                .sensoryFeedback(.selection, trigger: sayisalYanlisSayisi)
                .bold()
            } header: {
                Text("Sayısal Yetenek")
            } footer: {
                if sayisalDogruSayisi + sayisalYanlisSayisi > 15 {
                    Text("Toplam doğru ve yanlış sayısı 15'i geçemez")
                        .foregroundStyle(.red)
                }
            }
            
            Section {
                Stepper(value: $tarihDogruSayisi, in: 0...(10 - tarihYanlisSayisi)) {
                    Label("Doğru Sayısı: \(tarihDogruSayisi, specifier: "%.0f")", systemImage: "checkmark.circle")
                }
                .sensoryFeedback(.selection, trigger: tarihDogruSayisi)
                .bold()
                
                Stepper(value: $tarihYanlisSayisi, in: 0...(10 - tarihDogruSayisi)) {
                    Label("Yanlış Sayısı: \(tarihYanlisSayisi, specifier: "%.0f")", systemImage: "xmark.circle")
                }
                .sensoryFeedback(.selection, trigger: tarihYanlisSayisi)
                .bold()
            } header: {
                Text("Tarih")
            } footer: {
                if tarihDogruSayisi + tarihYanlisSayisi > 10 {
                    Text("Toplam doğru ve yanlış sayısı 10'i geçemez")
                        .foregroundStyle(.red)
                }
            }
            
            Section {
                Stepper(value: $cografyaDogruSayisi, in: 0...(8 - cografyaYanlisSayisi)) {
                    Label("Doğru Sayısı: \(cografyaDogruSayisi, specifier: "%.0f")", systemImage: "checkmark.circle")
                }
                .sensoryFeedback(.selection, trigger: cografyaDogruSayisi)
                .bold()
                
                Stepper(value: $cografyaYanlisSayisi, in: 0...(8 - cografyaDogruSayisi)) {
                    Label("Yanlış Sayısı: \(cografyaYanlisSayisi, specifier: "%.0f")", systemImage: "xmark.circle")
                }
                .sensoryFeedback(.selection, trigger: cografyaYanlisSayisi)
                .bold()
            } header: {
                Text("Türkie Coğrafyası")
            } footer: {
                if cografyaDogruSayisi + cografyaYanlisSayisi > 8 {
                    Text("Toplam doğru ve yanlış sayısı 8'i geçemez")
                        .foregroundStyle(.red)
                }
            }
            
            Section {
                Stepper(value: $mevzuatDogruSayisi, in: 0...(8 - mevzuatYanlisSayisi)) {
                    Label("Doğru Sayısı: \(mevzuatDogruSayisi, specifier: "%.0f")", systemImage: "checkmark.circle")
                }
                .sensoryFeedback(.selection, trigger: mevzuatDogruSayisi)
                .bold()
                
                Stepper(value: $mevzuatYanlisSayisi, in: 0...(8 - mevzuatDogruSayisi)) {
                    Label("Yanlış Sayısı: \(mevzuatYanlisSayisi, specifier: "%.0f")", systemImage: "xmark.circle")
                }
                .sensoryFeedback(.selection, trigger: mevzuatYanlisSayisi)
                .bold()
            } header: {
                Text("Mevzuat")
            } footer: {
                if mevzuatDogruSayisi + mevzuatYanlisSayisi > 8 {
                    Text("Toplam doğru ve yanlış sayısı 8'i geçemez")
                        .foregroundStyle(.red)
                }
            }
            
            Section {
                Stepper(value: $egitimDogruSayisi, in: 0...(24 - egitimYanlisSayisi)) {
                    Label("Doğru Sayısı: \(egitimDogruSayisi, specifier: "%.0f")", systemImage: "checkmark.circle")
                }
                .sensoryFeedback(.selection, trigger: egitimDogruSayisi)
                .bold()
                
                Stepper(value: $egitimYanlisSayisi, in: 0...(24 - egitimDogruSayisi)) {
                    Label("Yanlış Sayısı: \(egitimYanlisSayisi, specifier: "%.0f")", systemImage: "xmark.circle")
                }
                .sensoryFeedback(.selection, trigger: egitimYanlisSayisi)
                .bold()
            } header: {
                Text("Eğitim Temelleri")
            } footer: {
                if egitimDogruSayisi + egitimYanlisSayisi > 24 {
                    Text("Toplam doğru ve yanlış sayısı 24'i geçemez")
                        .foregroundStyle(.red)
                }
            }
            
            Section {
                HesaplaButton(title: "Hesapla") {
                    hesaplaAGSPuani()
                }
                .sensoryFeedback(.success, trigger: sonuc)
                .sheet(isPresented: $isShowingSheet) {
                    SonucView(sonuc2022: sonuc, 
                             sonucEB2022: 0.0, 
                             sonucOABT2022: 0.0, 
                             sonuc2023: 0.0, 
                             sonucEB2023: 0.0, 
                             sonucOABT2023: 0.0)
                }
            }
            
            Section {
                Text("AGS Puanı: \(String(format: "%.2f", sonuc))")
                    .font(.headline)
            }
        }
        .navigationTitle("AGS Hesaplama")
    }
    
    func hesaplaAGSPuani() {
        let sozelNet = sozelDogruSayisi - (sozelYanlisSayisi / 4)
        let sayisalNet = sayisalDogruSayisi - (sayisalYanlisSayisi / 4)
        let tarihNet = tarihDogruSayisi - (tarihYanlisSayisi / 4)
        let cografyaNet = cografyaDogruSayisi - (cografyaYanlisSayisi / 4)
        let mevzuatNet = mevzuatDogruSayisi - (mevzuatYanlisSayisi / 4)
        let egitimNet = egitimDogruSayisi - (egitimYanlisSayisi / 4)
        
        let toplamNet = sozelNet + sayisalNet + tarihNet + cografyaNet + mevzuatNet + egitimNet
        sonuc = (toplamNet / AGSConstants.toplamSoru) * 100
        
        let resultAGS = Result(sinavAdi: "2025 AGS", 
                             gyNet: sozelNet, 
                             gkNet: sayisalNet, 
                             ebNet: egitimNet, 
                             oabtNet: 0.0, 
                             sonuc: sonuc)
        
        modelContext.insert(resultAGS)
        isShowingSheet.toggle()
    }
}

#Preview {
    AGSView()
}
