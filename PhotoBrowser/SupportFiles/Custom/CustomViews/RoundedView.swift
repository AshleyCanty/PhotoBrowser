//
//  RoundedView.swift
//  PhotoBrowser
//
//  Created by ashley canty on 8/25/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import UIKit

class RoundedView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = .white
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
    }
}
