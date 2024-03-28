//
//  CustomButton.swift
//  GitGistsTest
//
//  Created by Евгений колесников on 28.03.2024.
//

import Foundation
import UIKit
import SnapKit


class CustomButton: UIView {
    
    let button = UIButton()
    let label = UILabel()
    
    
    var text: String = "Example text button" {
        didSet {
            self.label.text = text
        }
    }
    
    var font = UIFont() {
        didSet {
            self.label.font = font
        }
    }
    
    var textColor: UIColor = .black {
        didSet {
            self.label.textColor = textColor
        }
    }
    
    var textAligment: NSTextAlignment = .center {
        didSet {
            self.label.textAlignment = textAligment
        }
    }
    
    var bgColor: UIColor = hexStringToUIColor(hex: "7066CC") {
        didSet {
            self.backgroundColor = bgColor
        }
    }
    
    var isEnabled: Bool = true {
        didSet {
            self.button.isEnabled = isEnabled
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addSubview(button)
        self.addSubview(label)
        
        
        setConstrants()
        setUI()
    }
    
    private func setConstrants() {
        button.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        label.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.left.equalTo(self).inset(5)
            make.right.equalTo(self).inset(5)
        }
        
    }
    
    private func setUI() {
        self.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(vibro), for: .touchUpInside)
        self.bgColor = hexStringToUIColor(hex: "7066CC")
        self.label.textAlignment = .center
    }
    @objc private func vibro() {
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
    }
    
    private func enbleButton() {
        
        if button.isEnabled {
            UIView.animate(withDuration: 0.3) {
                self.button.alpha = 1
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                self.button.alpha = 0.5
            }
        }
    }
    
}

