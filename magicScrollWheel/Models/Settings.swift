//
//  Settings.swift
//  magicScrollWheel
//
//  Created by Aleksandr Kozhevnikov on 06/10/2019.
//  Copyright © 2019 Aleksandr Kozhevnikov. All rights reserved.
//

import Foundation
import CoreGraphics
import AppKit

class Settings {

    static let shared = Settings()

    var scrollDuration: Int = 400 {
        didSet {
            UserDefaults.standard.set(scrollDuration, forKey: "scrollDuration")
        }
    }
    
    var useBounceEffect: Bool = true {
        didSet {
            UserDefaults.standard.set(useBounceEffect, forKey: "useBounceEffect")
        }
    }
    
    var accelerationMultiplier: Float = 3.0 {
        didSet {
            UserDefaults.standard.set(accelerationMultiplier, forKey: "accelerationMultiplier")
        }
    }

    var bezierControlPoint1 = CGPoint.init(x: 0.3, y: 0.4) {
        didSet {
            UserDefaults.standard.set(NSStringFromPoint(bezierControlPoint1), forKey: "bezierControlPoint1")
        }
    }
    
    var bezierControlPoint2 = CGPoint.init(x: 0.37, y: 1) {
        didSet {
            UserDefaults.standard.set(NSStringFromPoint(bezierControlPoint2), forKey: "bezierControlPoint2")
        }
    }

    private init() {
        loadSettings()
    }
    
    private func loadSettings() {
        scrollDuration = UserDefaults.standard.object(forKey: "scrollDuration") as? Int ?? 400
        useBounceEffect = UserDefaults.standard.object(forKey: "useBounceEffect") as? Bool ?? true
        accelerationMultiplier = UserDefaults.standard.object(forKey: "accelerationMultiplier") as? Float ?? 3.0
        
        if let point1String = UserDefaults.standard.string(forKey: "bezierControlPoint1") {
            bezierControlPoint1 = NSPointFromString(point1String)
        }
        
        if let point2String = UserDefaults.standard.string(forKey: "bezierControlPoint2") {
            bezierControlPoint2 = NSPointFromString(point2String)
        }
    }

}
