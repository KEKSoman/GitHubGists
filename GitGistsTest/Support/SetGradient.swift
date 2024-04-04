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
    
    func addBorderGradient(color1: String, color2: String){
        self.layer.sublayers?.filter{ $0 is CAGradientLayer }.forEach{ $0.removeFromSuperlayer() }
        let borderGradient = CAGradientLayer()
        layoutIfNeeded()
//        borderGradient.cornerRadius = 10
        borderGradient.frame = CGRect(origin: .zero, size: self.frame.size)
        borderGradient.colors = [hexStringToUIColor(hex: color1).cgColor,
                                 hexStringToUIColor(hex: color2).cgColor]
        borderGradient.startPoint = CGPoint(x: 0, y: 0.5)
        borderGradient.endPoint = CGPoint(x: 1, y: 0.5)
        let shape = CAShapeLayer()
        shape.lineWidth = 4
        shape.path = UIBezierPath(rect: self.bounds).cgPath
        shape.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: 0).cgPath
        shape.strokeColor = UIColor.red.cgColor
        shape.fillColor = UIColor.clear.cgColor
        borderGradient.mask = shape
        self.layer.addSublayer(borderGradient)
    }
}
