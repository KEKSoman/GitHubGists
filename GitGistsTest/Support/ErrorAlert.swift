//
//  ErrorAlert.swift
//  GitGistsTest
//
//  Created by Евгений колесников on 04.04.2024.
//

import Foundation
import UIKit
import SnapKit

class CustomAlert: UIView {
    
    let backView = UIView()
    let label = UILabel()
    let button = CustomButton()
    let bgView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(bgView)
        bgView.addSubview(backView)
        backView.addSubview(label)
        backView.addSubview(button)
        setConstraints()
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        backView.layoutIfNeeded()
//        backView.addBorderGradient(color1: "25CED1", color2: "41A6FF")
    }
    
    private func setConstraints() {
        
        bgView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        backView.snp.makeConstraints { make in
            make.left.right.equalTo(bgView).inset(20)
            make.height.equalTo(label.snp.height).offset(100)
            make.centerX.equalTo(bgView.snp.centerX)
            make.centerY.equalTo(bgView.snp.centerY)
            make.bottom.greaterThanOrEqualTo(backView).inset(20 )
        }
        
        label.snp.makeConstraints { make in
            make.top.left.right.equalTo(backView).inset(20)
            //            make.bottom.equalTo(button.snp.top).offset(20)
        }
        
        button.snp.makeConstraints { make in
            make.bottom.left.right.equalTo(backView).inset(20)
            make.top.equalTo(label.snp.bottom).offset(20)
            make.height.equalTo(30)
        }
    }
    
    private func setUI() {
        bgView.backgroundColor = .black.withAlphaComponent(0.4)
        backView.backgroundColor = .black.withAlphaComponent(0.9)
//        button.backgroundColor = .clear
//        label.backgroundColor = .clear
        label.lineBreakMode = .byWordWrapping
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textAlignment = .center
        
        button.button.addTarget(self, action: #selector(closeAlert), for: .touchUpInside)
        button.text = "Ok"
    }
    
    @objc private func closeAlert() {
        UIView.animate(withDuration: 0.3) {
            self.isHidden = true
        }
    }
}

/*
 
 
 
 
 
 */
