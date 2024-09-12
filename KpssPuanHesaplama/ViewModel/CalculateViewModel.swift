//
//  CalculateViewModel.swift
//  KpssPuanHesaplama
//
//  Created by Tahir Atakan Can on 12.09.2024.
//

import Foundation
import Observation
import SwiftUI

@Observable
class CalculateViewModel{
    
    @ObservationIgnored @AppStorage("calculateCount") var calculateCount = 0
    
}
