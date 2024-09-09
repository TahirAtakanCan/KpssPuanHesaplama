//
//  SonucView.swift
//  KpssPuanHesaplama
//
//  Created by Tahir Atakan Can on 9.09.2024.
//

import SwiftUI

struct SonucView: View {
    
    let sonuc2022: Double
    let sonucEB2022: Double
    let sonucOABT2022: Double?
    
    let sonuc2023: Double
    let sonucEB2023: Double
    let sonucOABT2023: Double?
    
    
    var body: some View {
        
        NavigationStack {
            VStack {
                List {
                    
                    Section {
                        Text("2023 P3(Memur) Puanı: \(sonuc2023, specifier: "%.3f")")
                        Text("2023 P10(Öğretmen) Puanı: \(sonucEB2023, specifier: "%.3f")")
                        if sonucOABT2023 != nil {
                            Text("2023 P121(Alan) Puanı: \(sonucOABT2023 ?? 0, specifier: "%.3f")")
                        }
  
                    } header: {
                        Text("2023 KPSS")
                            .bold()
                            .foregroundStyle(.main)
                    }
                    
                    Section {
                        Text("2022 P3(Memur) Puanı: \(sonuc2022, specifier: "%.3f")")
                        Text("2022 P10(Öğretmen) Puanı: \(sonucEB2022, specifier: "%.3f")")
                        if sonucOABT2022 != nil {
                            Text("2022 P121(Alan) Puanı: \(sonucOABT2023 ?? 0, specifier: "%.3f")")
                        }
                            
                    } header: {
                        Text("2022 KPSS")
                            .bold()
                            .foregroundStyle(.main)
                    }
                }
            }
            .navigationTitle("Sonuç")
        }
        
    }
}

#Preview {
    SonucView(sonuc2022: 0, sonucEB2022: 0, sonucOABT2022: 0, sonuc2023: 0, sonucEB2023: 0, sonucOABT2023: 0)
}
