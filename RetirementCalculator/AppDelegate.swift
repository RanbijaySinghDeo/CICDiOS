//
//  AppDelegate.swift
//  RetirementCalculator
//
//  Created by Ranbijay SinghDeo on 02/07/26.
//

import UIKit
import AppCenter
import AppCenterAnalytics
import AppCenterCrashes

class AppDelegate: NSObject, UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        AppCenter.start(withAppSecret: "9510027f-ccc6-434f-a0b0-010dbd213d01",
                        services: [Analytics.self, Crashes.self])
        return true
    }
}
