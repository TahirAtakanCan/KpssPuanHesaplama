//
//  OABTView.swift
//  KpssPuanHesaplama
//
//  Created by Tahir Atakan Can on 10.07.2024.
//

import SwiftUI
import SwiftData

struct OABTView: View {
    
    @Environment(\.modelContext) private var modelContext
    
    @State private var gyDogruSayisi:Double = 30
    @State private var gyYanlisSayisi:Double = 0
    
    @State private var gkDogruSayisi:Double = 30
    @State private var gkYanlisSayisi:Double = 0
    
    @State private var ebDogruSayisi:Double = 40
    @State private var ebYanlisSayisi:Double = 0
    
    @State private var oabtDogruSayisi:Double = 40
    @State private var oabtYanlisSayisi:Double = 0
    
    @State private var sonuc2022:Double = 0
    @State private var sonucEB2022:Double = 0
    @State private var sonucOABT2022:Double = 0
    @State private var sonuc2023:Double = 0
    @State private var sonucEB2023:Double = 0
    @State private var sonucOABT2023:Double = 0
    
    @State private var oabtKatsayi = 0.4334
    @State private var oabtPuan = 43.805
    
    @State private var selectedOption = 0
    let options = [
        (0.4334,43.805, "Beden Eğitimi"),
        (0.3666,41.071, "Biyoloji"),
        (0.4301,39.060, "Coğrafya"),
        (0.4052,34.908, "Din Kültürü"),
        (0.3679,42.156, "Edebiyat"),
        (0.5388,39.313, "Fen Bilgisi"),
        (0.3817,41.604, "Fizik"),
        (0.5225,36.309, "İlköğretim Matematik"),
        (0.3883,37.962, "İmam Hatip Meslek Dersleri Ö."),
        //(0.3791,40.920, "İngilizce"),
        (0.4542,42.157, "Kimya"),
        (0.4247,41.759, "Lise Matematik"),
        (0.4944,33.292, "Okul Öncesi"),
        (0.4883,29.014, "Rehberlik "),
        (0.6184,33.598, "Sınıf Öğretmenliği"),
        (0.6142,34.101, "Sosyal Bilgiler"),
        (0.3521,41.418, "Tarih"),
        (0.4565,34.329, "Türkçe")
    ]
    
    @State private var isShowingSheet = false
    @State private var ydsPuani = ""
    @State private var isYabanciDil = false
    
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
                        .foregroundColor(.main)
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
                        .foregroundStyle(.main)
                } footer: {
                    if(gkDogruSayisi + gkYanlisSayisi > 60) {
                        Text("Toplam doğru ve yanlış sayıları 60'ı geçemez.")
                            .foregroundStyle(.red)
                    }
                }
                
                Section {
                    Stepper(value: $ebDogruSayisi, in: 0...(80 - ebYanlisSayisi)) {
                        Label("Doğru Sayısı: \(ebDogruSayisi, specifier: "%.0f")", systemImage: "checkmark.circle")
                    }
                    .sensoryFeedback(.selection, trigger: ebDogruSayisi)
                    .bold()
                    
                    Stepper(value: $ebYanlisSayisi, in: 0...(80 - ebDogruSayisi)) {
                        Label("Yanlış Sayısı: \(ebYanlisSayisi, specifier: "%.0f")", systemImage: "xmark.circle")
                    }
                    .sensoryFeedback(.selection, trigger: ebYanlisSayisi)
                    .bold()
                    
                } header: {
                    Text("Eğitim Bilimleri")
                        .textCase(.none)
                        .foregroundStyle(.main)
                } footer: {
                    if(ebDogruSayisi + ebYanlisSayisi > 80) {
                        Text("Toplam doğru ve yanlış sayıları 80'i geçemez.")
                            .foregroundStyle(.red)
                    }
                }
                
                Section(header: Text("Alan Seçimi")) {
                    Toggle("Yabancı Dil Alanı", isOn: $isYabanciDil)
                }
                
                if isYabanciDil {
                    Section(header: Text("YDS Puanı")) {
                        TextField("YDS Puanı", text: $ydsPuani)
                            .keyboardType(.decimalPad)
                    }
                }
                
                Section {
                    Picker("Bölüm Seçiniz", selection: $selectedOption) {
                        ForEach(0..<options.count, id: \.self) { index in
                            Text(options[index].2)
                        }
                    }
                    .onChange(of: selectedOption) {
                        oabtKatsayi = options[selectedOption].0
                        oabtPuan = options[selectedOption].1
                    }
                    
                    if !isYabanciDil {
                        Stepper(value: $oabtDogruSayisi, in: 0...(75 - oabtYanlisSayisi)) {
                            Label("Doğru Sayısı: \(oabtDogruSayisi, specifier: "%.0f")", systemImage: "checkmark.circle")
                        }
                        
                        Stepper(value: $oabtYanlisSayisi, in: 0...(75 - oabtDogruSayisi)) {
                            Label("Yanlış Sayısı: \(oabtYanlisSayisi, specifier: "%.0f")", systemImage: "xmark.circle")
                        }
                    }
                    
                    HesaplaButton(title: "Hesapla") {
                        let gkNet = gkDogruSayisi - (gkYanlisSayisi / 4)
                        let gyNet = gyDogruSayisi - (gyYanlisSayisi / 4)
                        let ebNet = ebDogruSayisi - (ebYanlisSayisi / 4)
                        
                        if isYabanciDil {
                            let ydsPuaniDouble = Double(ydsPuani) ?? 0
                            sonucOABT2022 = ydsPuaniDouble * AGSConstants.ydsPuanKatsayisi
                            
                            let resultYDS = Result(sinavAdi: "2025 YDS", 
                                                 gyNet: gyNet, 
                                                 gkNet: gkNet, 
                                                 ebNet: ebNet, 
                                                 oabtNet: ydsPuaniDouble, 
                                                 sonuc: sonucOABT2022)
                            
                            modelContext.insert(resultYDS)
                        } else {
                            let oabtNet = oabtDogruSayisi - (oabtYanlisSayisi / 4)
                            sonucOABT2022 = oabtPuan + gyNet * Constants.oabt2022GYKatsayi + gkNet * Constants.oabt2022GKKatsayi + ebNet * Constants.oabt2022GKKatsayi + oabtNet * oabtKatsayi
                            
                            let resultOABT = Result(sinavAdi: "2025 ÖABT", 
                                                  gyNet: gyNet, 
                                                  gkNet: gkNet, 
                                                  ebNet: ebNet, 
                                                  oabtNet: oabtNet, 
                                                  sonuc: sonucOABT2022)
                            
                            modelContext.insert(resultOABT)
                        }
                        
                        isShowingSheet.toggle()
                    }
                    .sheet(isPresented: $isShowingSheet) {
                        SonucView(sonuc2022: sonuc2022, 
                                 sonucEB2022: sonucEB2022, 
                                 sonucOABT2022: sonucOABT2022, 
                                 sonuc2023: sonuc2023, 
                                 sonucEB2023: sonucEB2023, 
                                 sonucOABT2023: nil)
                    }
                }
            }
            
        }
        .navigationTitle("ÖABT/YDS Hesaplama")
        .toolbar(.hidden, for: .tabBar)
    }
    
    var formKontrol: Bool {
        if((gyDogruSayisi + gyYanlisSayisi) > 60 || (gkDogruSayisi + gkYanlisSayisi) > 60 || (ebDogruSayisi + ebYanlisSayisi) > 80 || (oabtDogruSayisi + oabtYanlisSayisi) > 75) {
            return true
        }
        return false
    }
}


#Preview {
    OABTView()
}

