//
//  GistVCTableCell.swift
//  GitGistsTest
//
//  Created by Евгений колесников on 30.03.2024.
//

import Foundation
import UIKit
import SnapKit

class GistViewControllerTableCell: UITableViewCell {
    
    let gistTitle = UILabel()
    let backView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(backView)
        backView.addSubview(gistTitle)
        
        backView.snp.makeConstraints { make in
            make.top.bottom.equalTo(self).inset(10)
            make.left.right.equalTo(self)
        }
        
        gistTitle.snp.makeConstraints { make in
            make.centerY.equalTo(backView.snp.centerY)
            make.leftMargin.equalTo(backView).inset(10)
        }
        
        self.selectionStyle = .none
        gistTitle.font = .systemFont(ofSize: 20)
        gistTitle.textColor = .white.withAlphaComponent(0.7)
        gistTitle.numberOfLines = 0
        gistTitle.lineBreakMode = .byWordWrapping
        self.backgroundColor = .clear
        backView.backgroundColor = .black.withAlphaComponent(0.2)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backView.addBorderGradient(color1: "25CED1", color2: "41A6FF")
        backView.layer.cornerRadius = 10
    }
}
