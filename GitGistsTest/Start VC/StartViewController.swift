//
//  ViewController.swift
//  GitGistsTest
//
//  Created by Евгений колесников on 28.03.2024.
//

import UIKit
import SnapKit
import Lottie

final class StartViewController: UIViewController {
    
    
    let usernameField = UITextField()
    let button = CustomButton()
    var loaderView: LottieAnimationView?
    let alertView = CustomAlert()
    
    let network = Network()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(usernameField)
        view.addSubview(button)
        
        setConstratints()
        setUI()
        navigationItem.title = "Find GitHub gists by Username"
        view.addSubview(alertView)
    }
    
    override func viewWillLayoutSubviews() {
        view.setGradient(color1: "#bf6ddb", color2: "182172")
        [usernameField, button].forEach { item in
            item.layer.cornerRadius = 20
        }
        alertView.backView.addBorderGradient(color1: "25CED1", color2: "41A6FF")
        alertView.button.addBorderGradient(color1: "25CED1", color2: "41A6FF")
    }
    
    private func setConstratints() {
        usernameField.snp.makeConstraints { make in
            make.left.right.equalTo(view).inset(20)
            make.height.equalTo(50)
            make.centerY.equalTo(view.snp.centerY)
        }
        
        button.snp.makeConstraints { make in
            make.left.right.equalTo(view).inset(20)
            make.top.equalTo(usernameField.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
    }
    
    private func setUI() {
        usernameField.backgroundColor = .white
        usernameField.alpha = 0.7
        //        usernameField.placeholder = "Enter GitHub Username"
        usernameField.text = "tdsemina"
        usernameField.textAlignment = .center
        
        button.text = "Search GitHub Gists"
        button.font = .systemFont(ofSize: 24)
        button.button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        
        loaderView = .init(name: "loader")
        loaderView?.contentMode = .scaleAspectFit
        loaderView?.loopMode = .loop
        loaderView?.isHidden = true
        
        view.addSubview(loaderView!)
        loaderView?.snp.makeConstraints { make in
            make.height.width.equalTo(150)
            make.centerY.equalTo(view.snp.centerY)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        
        alertView.frame = view.frame
        alertView.isHidden = true
    }
    
    func startLoader() {
        UIView.animate(withDuration: 0.3) {
            self.loaderView?.isHidden = false
            self.loaderView?.play()
        }
    }
    
    func stopLoader() {
        UIView.animate(withDuration: 0.3) {
            self.loaderView?.stop()
            self.loaderView?.isHidden = true
        }
        
    }
    
    func showAlert(with text: String) {
        UIView.animate(withDuration: 0.3) {
            self.alertView.isHidden = false
            self.alertView.label.text = text
        }
    }
    
    @objc private func tapButton() {
        startLoader()
        Network.shared.loadGists(username: usernameField.text ?? "") { completion in
            
            DispatchQueue.main.async {
                
                switch completion {
                case 2:
                    self.stopLoader()
                    
                    guard let gists = Network.shared.gists else { return }
                    let gistsListVC = GistListViewController(gists: gists)
                    self.navigationController?.pushViewController(gistsListVC, animated: true)
                case 1:
                    self.stopLoader()
                    self.showAlert(with: "Cant find gists of this GitHub user")
                    self.usernameField.text = ""
                    
                default:
                    self.stopLoader()
                    self.showAlert(with: "Cant find this GitHub user")
                    self.usernameField.text = ""
                }
            }
        }
    }
}

