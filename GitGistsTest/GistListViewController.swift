//
//  GistList.swift
//  GitGistsTest
//
//  Created by Евгений колесников on 30.03.2024.
//

import Foundation
import SnapKit
import UIKit


class GistListViewController: UIViewController {
    
    let tableView = UITableView()
    let ownerImage = UIImageView()
    let ownerLabel = UILabel()
    let backView = UIView()
    var gists: [Gists]?
    
    init(gists: [Gists]) {
        self.gists = gists
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(backView)
        view.addSubview(tableView)
        
        backView.addSubview(ownerImage)
        backView.addSubview(ownerLabel)
        
        setConstraints()
        setUI()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.setGradient(color1: "D44343", color2: "000000")
    }
    
    
    private func setConstraints() {
        
        backView.snp.makeConstraints { make in
            make.top.left.right.equalTo(view)
            make.height.equalTo(100)
        }
        
        ownerImage.snp.makeConstraints { make in
            make.top.left.bottom.equalTo(backView).inset(10)
            make.width.equalTo(ownerImage.snp.height)
        }
        
        ownerLabel.snp.makeConstraints { make in
            make.left.equalTo(ownerImage.snp.right).offset(10)
            make.centerY.equalTo(backView.snp.centerY)
            make.rightMargin.greaterThanOrEqualTo(backView).inset(10)
        }

        tableView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(view).inset(20)
            make.top.equalTo(backView.snp.bottom)
        }
        
        
    }
    
    private func setUI() {
        backView.backgroundColor = .clear
        
        tableView.backgroundColor = .clear
        tableView.register(GistViewControllerTableCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorColor = .clear
        
        
        ownerLabel.text = "Owner name"
        ownerImage.image = UIImage(named: "owner")
        guard let gistsInfo = gists else { return }
        ownerLabel.text = gistsInfo[0].owner.login
    }
}


extension GistListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gists?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        print("== GISTS: \(gists) ===")
        guard let cell = cell as? GistViewControllerTableCell else { return }
        guard let gist = gists?[indexPath.row] else { return }
        cell.gistTitle.text = gist.description
        
        
        
        //TEst
    }
    
    
    
}
