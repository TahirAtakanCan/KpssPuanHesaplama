//
//  AddCoordinator.swift
//  KpssPuanHesaplama
//
//  Created by Tahir Atakan Can on 11.09.2024.
//

import Foundation
import GoogleMobileAds

class AdCoordinator: NSObject,GADFullScreenContentDelegate {
    
    static let shared = AdCoordinator()
    
    private var ad: GADInterstitialAd?
    
    override init() {
        super.init()
        loadAd()
    }
    
    
    
    func loadAd() {
        let request = GADRequest()
        request.scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        GADInterstitialAd.load(
            withAdUnitID: Constants.interstitialUnitID, request: request
        ) { ad, error in
            if let error = error {
                return print("Failed to load ad with error: \(error.localizedDescription)")
            }
            
            self.ad = ad
            self.ad?.fullScreenContentDelegate = self
            
        }
    }
    
    func presentAd() {
        guard let fullScreenAd = ad else {
            return print("Ad wasn't ready")
        }
        
        
        fullScreenAd.present(fromRootViewController: nil)
    }
}
