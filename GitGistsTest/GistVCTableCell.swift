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
        gistTitle.text = "Test Gist Title"
        gistTitle.font = .systemFont(ofSize: 20)
        self.backgroundColor = .clear
        backView.backgroundColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backView.layer.borderColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.5).cgColor
        backView.layer.cornerRadius = 10
    }
}
