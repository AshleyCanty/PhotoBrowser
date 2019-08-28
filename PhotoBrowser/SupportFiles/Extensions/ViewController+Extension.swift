//
//  ViewController+Extension.swift
//  PhotoBrowser
//
//  Created by ashley canty on 8/27/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import UIKit

extension UIViewController {
    func addGradient() {
        let gradientView = GradientView(frame: view.bounds)
        view.addSubview(gradientView)
        view.sendSubviewToBack(gradientView)
    }
    
    func setUpNavBar() {
        let textAttributes = [NSAttributedString.Key.foregroundColor: Color.PurpleMed]
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = Color.PurpleMed
        
        if DeviceSize.iPhoneScreenSizes() == .iPad {
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationController?.navigationBar.largeTitleTextAttributes = textAttributes
            return
        }
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
}
