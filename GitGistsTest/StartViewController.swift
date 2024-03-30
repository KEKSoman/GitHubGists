//
//  ViewController.swift
//  GitGistsTest
//
//  Created by Евгений колесников on 28.03.2024.
//

import UIKit
import SnapKit


class StartViewController: UIViewController {
    
    let topLabel =  UILabel()
    let usernameField = UITextField()
    let passwordField = UITextField()
    let button = CustomButton()
    let vStack = UIStackView()
    let backView = UIView(frame: .zero)
    
    let network = Network()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backView)
        backView.addSubview(vStack)
        addingLayers()
        setUI()
    }
    
    override func viewWillLayoutSubviews() {
        view.setGradient(color1: "#bf6ddb", color2: "182172")
        [usernameField, passwordField, button].forEach { item in
            item.layer.cornerRadius = 20
        }
        
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
        usernameField.text = "KEKSoman"
        
        passwordField.backgroundColor = .black
        passwordField.placeholder = "Function unaviable"
        passwordField.isEnabled = false
        
        
        
        button.text = "Search GitHub Gists"
        button.font = .systemFont(ofSize: 36)
        button.button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        
    }
    
    @objc private func tapButton() {
        Network.shared.loadGists(username: usernameField.text ?? "") { completion in
            
            guard let gists = Network.shared.gists else { return }
            if completion {
                DispatchQueue.main.async {
                    self.present(GistListViewController(gists: gists), animated: true)
                } 
            } else {
                print("Sorry response is nil")
            }
            
        }
        
        
        
        
    }
}

