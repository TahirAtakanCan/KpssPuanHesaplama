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
    @Query(sort: \TargetModel.targetDate, order: .reverse) private var pastTargets: [TargetModel]
    @Binding var selectionTabItem: Int
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(pastTargets) { target in
                        VStack(alignment: .leading) {
                            Text("Bölüm: \(target.selectedBolum)")
                                .bold()
                            Text("Hedef Puan: \(target.targetScore, specifier: "%.1f")")
                            Text("Hedef Tarih: \(target.targetDate, formatter: dateFormatter)")
                        }
                        .padding()
                    }
                    .onDelete { indexSet in
                        for index in indexSet {
                            modelContext.delete(pastTargets[index])
                        }
                        do {
                            try modelContext.save()
                        } catch {
                            print("Hata: \(error.localizedDescription)")
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



