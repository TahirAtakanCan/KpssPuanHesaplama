//
//  TargetView.swift
//  KpssPuanHesaplama
//
//  Created by Tahir Atakan Can on 5.10.2024.
//

import SwiftUI

struct TargetView: View {
    @State private var targetScore: Double = 70.0
    @State private var targetDate = Date()
    
    @State private var selectedBolum = "Ortaöğretim"
    
    let bolumler = ["Ortaöğretim", "On Lisans", "Lisans", "Egitim Bilimleri", "OABT"]
    
    var body: some View {
        Form {
            Section(header: Text("Bölüm Seçiniz")){
                Picker("Bölüm Seçiniz", selection: $selectedBolum){
                    ForEach(bolumler, id: \.self){
                        Text($0)
                            .foregroundStyle(.main)
                    }
                    .bold()
                }
                .pickerStyle(.menu)
                .foregroundStyle(.main)
                .bold()
                Text("Seçilen Bölüm: \(selectedBolum)")
                    .bold()
                    .foregroundStyle(.main)
            }
            Section(header: Text("Hedef Puan")) {
                Slider(value: $targetScore, in: 60...100, step: 0.1)
                    .accentColor(.main)
                Text("Hedef Puanı: \(targetScore, specifier: "%.1f")")
                    .bold()
                    .foregroundStyle(.main)
            }
            Section(header: Text("Hedef Tarih")) {
                DatePicker("Tarih Seçiniz", selection: $targetDate, displayedComponents: .date)
                    .bold()
                    .foregroundStyle(.main)
            }
            Section {
                //KaydetButton(title: "Kaydet")
            }
        }
    }
}

#Preview {
    TargetView()
}
