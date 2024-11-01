//
//  TargetView.swift
//  KpssPuanHesaplama
//
//  Created by Tahir Atakan Can on 5.10.2024.
//

import SwiftUI
import SwiftData

struct TargetView: View {
    @Binding var selectionTabItem: Int
    @Binding var pastTargets: [TargetModel]
    @State private var targetScore: Double = 70.0
    @State private var targetDate = Date()
    @State private var selectedBolum = "Ortaöğretim"
    
    let bolumler = ["Ortaöğretim", "On Lisans", "Lisans", "Egitim Bilimleri", "OABT"]
    
    @Environment(\.modelContext) private var modelContext
    @State private var isSaveViewActive = false  // Kaydetme sonrası PastTargetView'e geçiş için
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section(header: Text("Bölüm Seçiniz")) {
                        Picker("Bölüm Seçiniz", selection: $selectedBolum) {
                            ForEach(bolumler, id: \.self) {
                                Text($0).foregroundStyle(.main).bold()
                            }
                        }
                        .pickerStyle(.menu)
                        .foregroundStyle(.main).bold()
                        
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
                        KaydetButton(title: "Kaydet", action: {
                            saveTarget()
                        })
                        .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
                .navigationTitle("Hedef Belirleme")
            }
            //.navigationDestination(isPresented: $isSaveViewActive) {
            //    PastTargetView(selectionTabItem: $selectionTabItem, pastTargets: pastTargets)
            //}
        }
    }
    
    func saveTarget() {
        let newTarget = TargetModel(selectedBolum: selectedBolum, targetScore: targetScore, targetDate: targetDate)
        pastTargets.append(newTarget)
        isSaveViewActive = true
    }
}

#Preview {
    TargetView(selectionTabItem: .constant(0), pastTargets: .constant([]))
}






