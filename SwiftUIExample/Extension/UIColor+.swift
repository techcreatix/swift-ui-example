//
//  UIColor+.swift
//  SwiftUIExample
//
//  Created by Techcreatix on 6/16/20.
//  Copyright © 2020 Techcreatix. All rights reserved.
//

import Foundation
import SwiftUI

extension UIColor {
    convenience init?(hexString hex: String) {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
        
        guard cString.count == 6 else {
            return nil
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

extension Color {
    
    init?(hexString hex: String) {
        let color = Color(UIColor(hexString: hex) ?? .white)
        self = color ?? .white
    }
}
