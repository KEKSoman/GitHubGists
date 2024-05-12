//
//  NavigationController.swift
//  GitGistsTest
//
//  Created by Евгений колесников on 31.03.2024.
//

import Foundation
import UIKit


class NavigationViewController: UINavigationController {
    
    override func viewDidLoad() {
         super.viewDidLoad()
        
        UINavigationBar.appearance().isTranslucent = false
        
        let backgroundView = UIView()
        
        backgroundView.backgroundColor = .black
        view.insertSubview(backgroundView, at: 0)
        
        let titleTextAtributes: [NSAttributedString.Key : Any] = [
            .font : UIFont.systemFont(ofSize: 14),
            .foregroundColor : UIColor.white
                
        ]
        navigationBar.tintColor = .white
        navigationBar.titleTextAttributes = titleTextAtributes
    }
    
}
