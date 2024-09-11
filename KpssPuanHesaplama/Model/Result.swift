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
    @Attribute(.unique) var id: UUID
    var sinavAdi: String
    var gyNet: Double
    var gkNet: Double
    var ebNet: Double?
    var oabtNet: Double?
    var tarih: Date
    var sonuc: Double

    init(id: UUID = UUID(), sinavAdi: String, gyNet: Double, gkNet: Double, ebNet: Double? = nil, oabtNet: Double? = nil, sonuc: Double, tarih: Date = Date()) {
        self.id = id
        self.sinavAdi = sinavAdi
        self.gyNet = gyNet
        self.gkNet = gkNet
        self.ebNet = ebNet
        self.oabtNet = oabtNet
        self.sonuc = sonuc
        self.tarih = tarih
    }
}

