//
//  Overlay+Extensions.swift
//  PhotoBrowser
//
//  Created by ashley canty on 8/27/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import UIKit
import Mortar
import Koloda

// Extended Koloda's OverlayView class for direct access to OverlayView instances

extension OverlayView {
    
    func customOverlay() {
        let image = UIImage(named: "heart")
        var imageView = UIImageView()
        
        imageView = UIImageView.m_create(creatorFunc: {
            $0.image = image
            $0.contentMode = .scaleAspectFill
            $0.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        })
        
        self |+| imageView
        
        [ imageView.m_center |=| self.m_center ].activate()
        self.backgroundColor = Color.GreenLight.withAlphaComponent(0.75)
        self.clipsToBounds = true
        self.layer.cornerRadius = 8
        layoutIfNeeded()
    }
    
    func clearOverlay() {
        self.backgroundColor = .clear
        for x in self.subviews {
            if x is UIImageView {
                x.removeFromSuperview()
            }
        }
        layoutIfNeeded()
    }
}
