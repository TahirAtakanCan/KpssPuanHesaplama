//
//  PastTargetView.swift
//  KpssPuanHesaplama
//
//  Created by Tahir Atakan Can on 6.10.2024.
//

import SwiftUI

struct PastTargetView: View {
    @Binding var selectionTabItem: Int
    @State private var pastTargets: [Target] = []
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(pastTargets) { target in
                        VStack(alignment: .leading, spacing: 8) {
                            Text(target.selectedBolum)
                                .bold()
                                .font(.headline)
                            
                            HStack {
                                Text("Hedef Puan:")
                                Text(String(format: "%.1f", target.targetScore))
                                    .bold()
                            }
                            
                            HStack {
                                Text("Hedef Tarih:")
                                Text(target.targetDate.formatted(date: .long, time: .omitted))
                                    .italic()
                            }
                        }
                        .padding(.vertical, 8)
                    }
                    .onDelete { indexSet in
                        pastTargets.remove(atOffsets: indexSet)
                        saveTargets()
                    }
                }
                .onAppear {
                    pastTargets = loadTargets()
                }
                .overlay {
                    if pastTargets.isEmpty {
                        ContentUnavailableView {
                            Label("Hedef Bulunamadı", systemImage: "target")
                        } description: {
                            Text("Henüz hedef belirlemediniz. Yeni hedef belirlemek için hedef belirleme sekmesini kullanın.")
                        } actions: {
                            Button("Hedef Belirle") {
                                selectionTabItem = 2
                            }
                        }
                    }
                }
            }
            .navigationTitle("Geçmiş Hedefler")
            .toolbar {
                EditButton()
            }
        }
    }
    
    func saveTargets() {
        if let encoded = try? JSONEncoder().encode(pastTargets) {
            UserDefaults.standard.set(encoded, forKey: "targets")
        }
    }
    
    func loadTargets() -> [Target] {
        if let data = UserDefaults.standard.data(forKey: "targets"),
           let targets = try? JSONDecoder().decode([Target].self, from: data) {
            return targets
        }
        return []
    }
}



