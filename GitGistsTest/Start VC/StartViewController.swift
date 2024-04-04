//
//  ViewController.swift
//  GitGistsTest
//
//  Created by Евгений колесников on 28.03.2024.
//

import UIKit
import SnapKit
import Lottie

class StartViewController: UIViewController {
    
    let topLabel =  UILabel()
    let usernameField = UITextField()
    let passwordField = UITextField()
    let button = CustomButton()
    let vStack = UIStackView()
    let backView = UIView(frame: .zero)
    var loaderView: LottieAnimationView?
    let alertView = CustomAlert()
    
    let network = Network()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.addSubview(backView)
        backView.addSubview(vStack)
        
        addingLayers()
        setUI()
        navigationItem.title = "Start VC"
        view.addSubview(alertView)
    }
    
    override func viewWillLayoutSubviews() {
        view.setGradient(color1: "#bf6ddb", color2: "182172")
        [usernameField, passwordField, button].forEach { item in
            item.layer.cornerRadius = 20
        }
        alertView.backView.addBorderGradient(color1: "25CED1", color2: "41A6FF")
        alertView.button.addBorderGradient(color1: "25CED1", color2: "41A6FF")
    }
    
    
    func addingLayers() {
        
        backView.snp.makeConstraints { make in
            make.centerY.equalTo(self.view)
            make.height.equalTo(self.view).dividedBy(2)
            make.horizontalEdges.equalTo(self.view).inset(20)
        }
        
        vStack.snp.makeConstraints { make in
            make.edges.equalTo(backView)
        }
        
        [topLabel, usernameField, passwordField, button].forEach { item in
            item.translatesAutoresizingMaskIntoConstraints = false
            vStack.addArrangedSubview(item)
        }
        
        
        
    }
    
    private func setUI() {
        backView.backgroundColor = .clear
        
        vStack.backgroundColor = .clear
        vStack.axis = .vertical
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.clipsToBounds = true
        vStack.contentMode = .scaleToFill
        vStack.distribution = .fillEqually
        vStack.spacing = 20
        
        
        topLabel.backgroundColor = .cyan
        topLabel.text = "Fing GitHub Gists"
        topLabel.textAlignment = .center
        
        usernameField.backgroundColor = .white
        usernameField.alpha = 0.7
        // usernameField.placeholder = "Enter GitHub Username"
        usernameField.textAlignment = .center
        usernameField.text = "Jrterhgwefwdasgdshfjg"
        
        passwordField.backgroundColor = .clear
        passwordField.placeholder = "Function unaviable"
        passwordField.isEnabled = false
        
        
        
        button.text = "Search GitHub Gists"
        button.font = .systemFont(ofSize: 36)
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
                if completion {
                    self.stopLoader()
                    
                    guard let gists = Network.shared.gists else { return }
                    let gistsListVC = GistListViewController(gists: gists)
                    self.navigationController?.pushViewController(gistsListVC, animated: true)
                    
                }
                else {
                    self.stopLoader()
                    self.showAlert(with: "Sorry, response is nil")
                }
            }
        }
    }
    
 
}

