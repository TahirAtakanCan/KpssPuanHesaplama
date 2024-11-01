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
    @State private var targetScore: Double = 70.0
    @State private var targetDate = Date()
    @State private var selectedBolum = "Ortaöğretim"
    
    let bolumler = ["Ortaöğretim", "On Lisans", "Lisans", "Egitim Bilimleri", "OABT"]
    
    @Environment(\.modelContext) private var modelContext
    
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
        // Toplam hedef sayısını kontrol et
        if let count = try? modelContext.fetch(FetchDescriptor<Target>()).count {
            // Yeni hedefi oluştur
            let newTarget = Target(selectedBolum: selectedBolum, targetScore: targetScore, targetDate: targetDate)
            modelContext.insert(newTarget)
            
            do {
                try modelContext.save()
                // Kayıt başarılı olduğunda formu temizle
                selectedBolum = "Ortaöğretim"
                targetScore = 70.0
                targetDate = Date()
                
                // Başarıyla kaydedildikten sonra Geçmiş Hedefler ekranına geç
                selectionTabItem = 3 // `PastTargetView`'in tab indeksi olarak ayarlayın
            } catch {
                print("Kaydetme hatası: \(error.localizedDescription)")
            }
        }
    }

}

#Preview {
    TargetView(selectionTabItem: .constant(0))
}






