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
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backView)
        backView.addSubview(vStack)
        addingLayers()
        setUI()
    }


    func addingLayers() {
        backView.backgroundColor = .white
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
        view.backgroundColor = .gray
        
        vStack.backgroundColor = .red
        vStack.axis = .vertical
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.clipsToBounds = true
        vStack.contentMode = .scaleToFill
        vStack.distribution = .fillEqually
        vStack.spacing = 20
        
        
        topLabel.backgroundColor = .cyan
        usernameField.backgroundColor = .systemPink
        passwordField.backgroundColor = .yellow
//        button.backgroundColor = .green
        
        [usernameField, passwordField].forEach { item in
            item.placeholder = "Example placeholder text"
        }
        button.text = "Example button text"
        button.font = .systemFont(ofSize: 36)
        button.button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        topLabel.text = "TopLabelText"
    }
    
    @objc private func tapButton() {
        print("Buton tapped")
    }
}

