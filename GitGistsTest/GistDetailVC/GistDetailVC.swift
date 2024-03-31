//
//  GistDetailVC.swift
//  GitGistsTest
//
//  Created by Евгений колесников on 31.03.2024.
//

import Foundation
import UIKit
import SnapKit

class GistDetailViewController: UIViewController {
    
    let textView = UITextView()
    var gist: GistDetailModel? = GistDetailNetwork.shared.gistDetail
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(textView)
        setConstraints()
        textView.textColor = .black
        textView.font = .systemFont(ofSize: 14)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textView.text = gist?.files.gistfile1.content ?? ""
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    
    func setConstraints() {
        textView.snp.makeConstraints { make in
            make.edges.equalTo(view).inset(20)
        }
    }
}
