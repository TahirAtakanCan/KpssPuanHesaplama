//
//  AGSView.swift
//  KpssPuanHesaplama
//
//  Created by Tahir Atakan Can on 6.01.2025.
//

import SwiftUI

struct AGSView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var sozelYetenek = ""
    @State private var sayisalYetenek = ""
    @State private var tarih = ""
    @State private var turkiyeCografyasi = ""
    @State private var mevzuat = ""
    @State private var egitimTemelleri = ""
    @State private var sonuc = 0.0
    @State private var isShowingSheet = false
    
    var body: some View {
        
                Form {
                    Section(header: Text("AGS Puanı Hesaplama")) {
                        TextField("Sözel Yetenek Doğru Sayısı", text: $sozelYetenek)
                            .keyboardType(.numberPad)
                        TextField("Sayısal Yetenek Doğru Sayısı", text: $sayisalYetenek)
                            .keyboardType(.numberPad)
                        TextField("Tarih Doğru Sayısı", text: $tarih)
                            .keyboardType(.numberPad)
                        TextField("Türkiye Coğrafyası Doğru Sayısı", text: $turkiyeCografyasi)
                            .keyboardType(.numberPad)
                        TextField("Mevzuat Doğru Sayısı", text: $mevzuat)
                            .keyboardType(.numberPad)
                        TextField("Eğitim Temelleri Doğru Sayısı", text: $egitimTemelleri)
                            .keyboardType(.numberPad)
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
        let sozel = Double(sozelYetenek) ?? 0
        let sayisal = Double(sayisalYetenek) ?? 0
        let tarihPuan = Double(tarih) ?? 0
        let cografya = Double(turkiyeCografyasi) ?? 0
        let mevzuatPuan = Double(mevzuat) ?? 0
        let egitim = Double(egitimTemelleri) ?? 0
        
        let toplamDogru = sozel + sayisal + tarihPuan + cografya + mevzuatPuan + egitim
        sonuc = (toplamDogru / AGSConstants.toplamSoru) * 100
        
        let resultAGS = Result(sinavAdi: "2025 AGS", 
                             gyNet: sozel, 
                             gkNet: sayisal, 
                             ebNet: egitim, 
                             oabtNet: nil, 
                             sonuc: sonuc)
        
        modelContext.insert(resultAGS)
        isShowingSheet.toggle()
    }
}

#Preview {
    AGSView()
}
