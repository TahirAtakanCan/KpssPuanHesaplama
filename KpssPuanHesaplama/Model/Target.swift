//
//  Target.swift
//  KpssPuanHesaplama
//
//  Created by Tahir Atakan Can on 5.10.2024.
//

import Foundation

struct Target: Identifiable, Codable {
    var id: UUID
    var selectedBolum: String
    var targetScore: Double
    var targetDate: Date
}

