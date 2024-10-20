//
//  KaydetButton.swift
//  KpssPuanHesaplama
//
//  Created by Tahir Atakan Can on 6.10.2024.
//

import SwiftUI

struct KaydetButton: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }, label:{
            Label(title, systemImage: "square.and.arrow.down.fill")
                .font(.title3)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)  // Daha basit ve çelişkisiz bir frame
        })
        .buttonStyle(.borderedProminent)
        .tint(.main)
    }
}

#Preview {
    KaydetButton(title: "Kaydet", action: {
        print("Ilk SwiftUI uygulamam")
    })
}

