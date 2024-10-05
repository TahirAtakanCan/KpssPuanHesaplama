//
//  Target.swift
//  KpssPuanHesaplama
//
//  Created by Tahir Atakan Can on 5.10.2024.
//

import Foundation
import SwiftData


struct Target: Identifiable{
    @Attribute(.unique) var id: UUID
    //let id = UUID()
    var targetScore: Double
    var date: Date
    
}
