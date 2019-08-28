//
//  RoundedImageView.swift
//  PhotoBrowser
//
//  Created by ashley canty on 8/26/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import UIKit

class RoundedImageView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.clipsToBounds = true
        self.layer.cornerRadius = 8
        self.contentMode = .scaleAspectFill
    }
}


