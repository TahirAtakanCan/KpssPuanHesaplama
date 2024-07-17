//
//  HesaplaButton.swift
//  KpssPuanHesaplama
//
//  Created by Tahir Atakan Can on 17.07.2024.
//

import SwiftUI

struct HesaplaButton: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Text(title)
                .bold()
                .font(.title2)
                .padding(8)
                .frame(maxWidth: .infinity)
        })
        .buttonStyle(.borderedProminent)
        .tint(.main)
        
    
    }
}

#Preview {
    HesaplaButton(title: "Hesapla", action: {
        print("Ilk SwiftUI uygulamam")
    })
}
