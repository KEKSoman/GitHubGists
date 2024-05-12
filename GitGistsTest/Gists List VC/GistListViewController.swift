//
//  GistList.swift
//  GitGistsTest
//
//  Created by Евгений колесников on 30.03.2024.
//

import Foundation
import SnapKit
import UIKit


final class GistListViewController: UIViewController {
    
    let tableView = UITableView()
    let ownerImage = UIImageView()
    let backView = UIView()
    var gists: [Gists]?
    let alert = CustomAlert()
    var navigationTitle: String?
    
    init(gists: [Gists]? = nil, title: String? = "") {
        self.gists = gists
        self.navigationTitle = title
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(backView)
        view.addSubview(tableView)
        view.addSubview(alert)
        
        backView.addSubview(ownerImage)
        navigationItem.title = navigationTitle
        setConstraints()
        setUI()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateAvatar), name: NSNotification.Name("avatar"), object: nil)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.setGradient(color1: "9E70AD", color2: "182172")
    }
    
    
    private func setConstraints() {
        
        backView.snp.makeConstraints { make in
            make.top.left.right.equalTo(view)
            make.height.equalTo(100)
        }
        
        ownerImage.snp.makeConstraints { make in
            make.top.bottom.equalTo(backView).inset(10)
            make.centerX.equalTo(backView.snp.centerX)
            make.width.equalTo(ownerImage.snp.height)
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
        
        alert.isHidden = true
        ownerImage.image = UIImage(named: "defaultAvatar")
    }
    
    @objc private func updateAvatar() {
        DispatchQueue.main.async {
            self.ownerImage.image = Network.shared.avatarImage
        }
        
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
        guard let cell = cell as? GistViewControllerTableCell else { return }
        guard let gist = gists?[indexPath.row] else { return }
        cell.gistTitle.text = gist.description
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let gists = gists?[indexPath.row] else { return }
        let gistDetailVC = GistDetailViewController(title: gists.description)
        
        GistDetailNetwork.shared.getGistDetailInformation(gistUrl: gists.url) { completion in
            if completion {
                DispatchQueue.main.async {
                    self.navigationController?.pushViewController(gistDetailVC, animated: true)
                }
            } else {
                print("Cant open gist detail")
            }
        }
        
        
        
                
    }
    
    
    
}
