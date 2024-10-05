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
    
    var body: some View {
        Form {
            Section(header: Text("Hedef Puan")) {
                Slider(value: $targetScore, in: 60...100, step: 0.1)
                Text("Hedef Puanı: \(targetScore, specifier: "%.1f")")
            }
            Section(header: Text("Hedef Tarih")) {
                DatePicker("Tarih Seçiniz", selection: $targetDate, displayedComponents: .date)
            }
        }
    }
}

#Preview {
    TargetView()
}
