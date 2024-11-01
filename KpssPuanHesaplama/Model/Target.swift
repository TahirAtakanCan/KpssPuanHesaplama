//
//  Target.swift
//  KpssPuanHesaplama
//
//  Created by Tahir Atakan Can on 5.10.2024.
//

import Foundation
import SwiftData


@Model
class TargetModel: Identifiable {
    @Attribute(.unique) var id: UUID
    var selectedBolum: String
    var targetScore: Double
    var targetDate: Date

    init(id: UUID = UUID(), selectedBolum: String, targetScore: Double, targetDate: Date) {
        self.id = id
        self.selectedBolum = selectedBolum
        self.targetScore = targetScore
        self.targetDate = targetDate
    }
}

