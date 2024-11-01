//
//  PastTargetView.swift
//  KpssPuanHesaplama
//
//  Created by Tahir Atakan Can on 6.10.2024.
//

import SwiftUI

struct PastTargetView: View {
    @Binding var selectionTabItem: Int
    var pastTargets: [TargetModel]
    
    var body: some View {
        NavigationStack{
            
        VStack {
            List(pastTargets) { target in
                VStack(alignment: .leading) {
                    Text("Bölüm: \(target.selectedBolum)")
                        .bold()
                    Text("Hedef Puan: \(target.targetScore, specifier: "%.1f")")
                    Text("Hedef Tarih: \(target.targetDate, formatter: dateFormatter)")
                }
                .padding()
            }
        }
        .navigationTitle("Geçmiş Hedefler")
        }
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
}()

#Preview {
    PastTargetView(selectionTabItem: .constant(0), pastTargets: [])
}



