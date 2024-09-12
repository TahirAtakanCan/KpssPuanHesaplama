//
//  UIOnboardingHelper.swift
//  KpssPuanHesaplama
//
//  Created by Tahir Atakan Can on 12.09.2024.
//

import UIKit
import UIOnboarding

struct UIOnboardingHelper {
    // App Icon
    static func setUpIcon() -> UIImage {
        return Bundle.main.appIcon ?? .init(named: "onboarding-icon")!
    }

    // First Title Line
    // Welcome Text
    static func setUpFirstTitleLine() -> NSMutableAttributedString {
        .init(string: "KPSS", attributes: [.foregroundColor: UIColor.label])
    }
    
    // Second Title Line
    // App Name
    static func setUpSecondTitleLine() -> NSMutableAttributedString {
        .init(string: Bundle.main.displayName ?? "Puan Hesaplama", attributes: [
            .foregroundColor: UIColor.main
        ])
    }

    // Core Features
    static func setUpFeatures() -> Array<UIOnboardingFeature> {
        return .init([
            .init(icon: .init(named: "lise")!,
                  title: "B Grubu (Memurluk)",
                  description: "Lisans, Önlisans ve Ortaöğretim mezunu olup memurluk için hazırlananlar..."),
            .init(icon: .init(named: "lisans")!,
                  title: "Eğitim Bilimleri",
                  description: "Sadece Eğitim Bilimlerinden sorumlu olup, ÖABT girmeyecek adaylar..."),
            .init(icon: .init(named: "oabt")!,
                  title: "Öğretmenlik Alan Bilgisi",
                  description: "Öğretmenlik P(121) için hazırlanan adaylar..."),
            .init(icon: .init(named: "calculate")!,
                  title: "Geçmiş Hesaplamalar",
                  description: "Daha önceki yaptığınız hesaplamalar ulaşabiliyorsunuz...")
        ])
    }

    // Notice Text
    static func setUpNotice() -> UIOnboardingTextViewConfiguration {
        return .init(icon: .init(named: "onboarding-notice-icon"),
                     text: "Geçmiş yılların istatistiklerini kullanarak hazırlanmıştır... ",
                     linkTitle: "Sorularınız için :",
                     link: "tahiratakancan@gmail.com",
                     tint: .main)
    }

    // Continuation Title
    static func setUpButton() -> UIOnboardingButtonConfiguration {
        return .init(title: "Devam Et",
                     backgroundColor: .main)
    }
}


extension UIOnboardingViewConfiguration {
    // UIOnboardingViewController init
    static func setUp() -> UIOnboardingViewConfiguration {
        return .init(appIcon: UIOnboardingHelper.setUpIcon(),
                     firstTitleLine: UIOnboardingHelper.setUpFirstTitleLine(),
                     secondTitleLine: UIOnboardingHelper.setUpSecondTitleLine(),
                     features: UIOnboardingHelper.setUpFeatures(),
                     textViewConfiguration: UIOnboardingHelper.setUpNotice(),
                     buttonConfiguration: UIOnboardingHelper.setUpButton())
    }
}
