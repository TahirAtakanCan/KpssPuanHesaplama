//
//  AGSView.swift
//  KpssPuanHesaplama
//
//  Created by Tahir Atakan Can on 6.01.2025.
//

import SwiftUI

struct AGSView: View {
    @State private var sozelYetenek = ""
    @State private var sayisalYetenek = ""
    @State private var tarih = ""
    @State private var turkiyeCografyasi = ""
    @State private var mevzuat = ""
    @State private var egitimTemelleri = ""
    @State private var sonuc = 0.0
    
    
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
                        Button("Hesapla") {
                            HesaplaButton()
                        }
                    }
                    
                    Section {
                        Text("AGS Puanı: \(String(format: "%.2f", sonuc))")
                            .font(.headline)
                    }
                }
                .navigationTitle("AGS Hesaplama")
            }
            
    func HesaplaButton() {
                let sozel = Double(sozelYetenek) ?? 0
                let sayisal = Double(sayisalYetenek) ?? 0
                let tarihPuan = Double(tarih) ?? 0
                let cografya = Double(turkiyeCografyasi) ?? 0
                let mevzuatPuan = Double(mevzuat) ?? 0
                let egitim = Double(egitimTemelleri) ?? 0
                
                let toplamDogru = sozel + sayisal + tarihPuan + cografya + mevzuatPuan + egitim
                sonuc = (toplamDogru / AGSConstants.toplamSoru) * 100
        
    }
}

#Preview {
    AGSView()
}
