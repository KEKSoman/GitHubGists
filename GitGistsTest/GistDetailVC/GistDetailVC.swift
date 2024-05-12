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
    var gist: GistDetailModel?
   let alert = CustomAlert()
     var navigationTitle: String?
    
    init(title: String? = "") {
        self.navigationTitle = title
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(textView)
        view.addSubview(alert)
        setConstraints()
        textView.textColor = .white
        textView.font = .systemFont(ofSize: 14)
        textView.backgroundColor = .clear
        alert.isHidden = true
        navigationItem.title = navigationTitle
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "copy"),
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(copyText))
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        gist = GistDetailNetwork.shared.gistDetail
        textView.text = gist?.files.gistfile1.content ?? ""
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.setGradient(color1: "62486D", color2: "182172")
    }
    
    
    private func setConstraints() {
        textView.snp.makeConstraints { make in
            make.edges.equalTo(view).inset(20)
        }
        
        alert.frame = view.frame
    }
    
    @objc private func copyText() {
        UIPasteboard.general.string = textView.text
        showCopyAlert()
    }
    
    private func showCopyAlert() {
        UIView.animate(withDuration: 0.3) {
            self.alert.isHidden = false
            self.alert.label.text = "Gist copied"
        }
       
        
        
    }
}
