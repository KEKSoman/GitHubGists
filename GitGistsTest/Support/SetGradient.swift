//
//  SetGradient.swift
//  GitGistsTest
//
//  Created by Евгений колесников on 30.03.2024.
//

import Foundation
import UIKit

extension UIView {
    func setGradient(color1: String, color2: String) {
        let gradient = CAGradientLayer()
        let color1 = hexStringToUIColor(hex: color1).cgColor
        let color2 = hexStringToUIColor(hex: color2).cgColor
        gradient.colors = [color1, color2]
        gradient.startPoint = CGPoint(x: 0.5, y: 0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1)
        gradient.frame = self.bounds
        self.layer.insertSublayer(gradient, at: 0)
        
    }
}
