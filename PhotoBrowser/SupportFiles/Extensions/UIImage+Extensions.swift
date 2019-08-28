//
//  UIImage+Extensions.swift
//  PhotoBrowser
//
//  Created by ashley canty on 8/26/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import UIKit

extension UIImage {
    
    enum JPEGQuality: CGFloat {
        case lowest  = 0
        case low     = 0.25
        case medium  = 0.5
        case high    = 0.75
        case highest = 1
    }
    
    func jpeg(_ jpegQuality: JPEGQuality) -> Data? {
        return jpegData(compressionQuality: jpegQuality.rawValue)
    }
}
