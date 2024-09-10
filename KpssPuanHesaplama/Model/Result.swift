//
//  Result.swift
//  KpssPuanHesaplama
//
//  Created by Tahir Atakan Can on 10.09.2024.
//

import Foundation
import SwiftData

@Model
class Result: Identifiable {
    
    @Attribute(.unique) let id = UUID()
    let sınavAdi: String
    let gyNet: Double
    let gkNet: Double
    let ebNet: Double?
    let oabtNet: Double?
    let tarih = Date()
    let sonuc: Double

    init(sınavAdi: String, gyNet: Double, gkNet: Double, ebNet: Double? = nil, oabtNet: Double? = nil, tarih: Date, sonuc: Double) {
        self.sınavAdi = sınavAdi
        self.gyNet = gyNet
        self.gkNet = gkNet
        self.ebNet = ebNet
        self.oabtNet = oabtNet
        self.tarih = tarih
        self.sonuc = sonuc
    }
    
}
