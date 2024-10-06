//
//  Target.swift
//  KpssPuanHesaplama
//
//  Created by Tahir Atakan Can on 5.10.2024.
//

import Foundation
import SwiftData


@Model
class TargetModel {
    var selectedBolum: String
    var targetScore: Double
    var targetDate: Date
    
    init(selectedBolum: String, targetScore: Double, targetDate: Date) {
        self.selectedBolum = selectedBolum
        self.targetScore = targetScore
        self.targetDate = targetDate
    }
}

