//
//  PastTargetView.swift
//  KpssPuanHesaplama
//
//  Created by Tahir Atakan Can on 6.10.2024.
//

import SwiftUI
import SwiftData

struct PastTargetView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Target.targetDate, order: .reverse) private var pastTargets: [Target]
    @Binding var selectionTabItem: Int
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(pastTargets) { target in
                        VStack(alignment: .leading, spacing: 8) {
                            Text(target.selectedBolum)
                                .bold()
                                .font(.headline)
                                .foregroundColor(.main)
                            
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
                        for index in indexSet {
                            modelContext.delete(pastTargets[index])
                        }
                        do {
                            try modelContext.save()
                        } catch {
                            print("Silme hatası: \(error.localizedDescription)")
                        }
                    }
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
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
}()

#Preview {
    PastTargetView(selectionTabItem: .constant(1))
}



