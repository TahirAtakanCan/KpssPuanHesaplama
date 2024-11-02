//
//  TargetView.swift
//  KpssPuanHesaplama
//
//  Created by Tahir Atakan Can on 5.10.2024.
//

import SwiftUI

struct TargetView: View {
    @Binding var selectionTabItem: Int
    @State private var targetScore: Double = 70.0
    @State private var targetDate = Date()
    @State private var selectedBolum = "Ortaöğretim"
    
    let bolumler = ["Ortaöğretim", "On Lisans", "Lisans", "Egitim Bilimleri", "OABT"]
    
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
                            print("Butona basıldı")
                            saveTarget()
                        })
                        .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
                .navigationTitle("Hedef Belirleme")
            }
        }
    }
    
    func saveTarget() {
        let newTarget = Target(id: UUID(), selectedBolum: selectedBolum, targetScore: targetScore, targetDate: targetDate)
        
        var targets = loadTargets()
        targets.append(newTarget)
        
        if let encoded = try? JSONEncoder().encode(targets) {
            UserDefaults.standard.set(encoded, forKey: "targets")
        }
        
        selectionTabItem = 3
    }
    
    func loadTargets() -> [Target] {
        if let data = UserDefaults.standard.data(forKey: "targets"),
           let targets = try? JSONDecoder().decode([Target].self, from: data) {
            return targets
        }
        return []
    }
}


#Preview {
    TargetView(selectionTabItem: .constant(2))
}





