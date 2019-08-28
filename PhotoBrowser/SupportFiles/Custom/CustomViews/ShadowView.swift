//
//  ShadowView.swift
//  PhotoBrowser
//
//  Created by ashley canty on 8/25/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import UIKit

class ShadowView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setUpView()
    }
    
    func setUpView() {
        self.layer.shadowRadius = 12
        self.layer.shadowOpacity = 0.60
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.backgroundColor = .clear
        
        // Set shadowView's frame to its first subview's bounds
        if let subview = self.subviews.first {
            self.layer.shadowPath = UIBezierPath(roundedRect: subview.bounds, cornerRadius: 5).cgPath
        }
    }
}
