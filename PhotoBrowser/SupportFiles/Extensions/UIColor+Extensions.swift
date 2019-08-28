//
//  UIColor+Extensions.swift
//  PhotoBrowser
//
//  Created by ashley canty on 8/26/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import UIKit

extension UIColor {
    
    func getGradientColors() -> [CGColor] {
        let colorA = UIColor(red: 211/255, green: 84/255, blue: 216/255, alpha: 1).cgColor
        let colorB = UIColor(red: 169/255, green: 76/255, blue: 203/255, alpha: 1).cgColor
        let colorC = UIColor(red: 143/255, green: 88/255, blue: 232/255, alpha: 1).cgColor
        let colorD = UIColor(red: 115/255, green: 87/255, blue: 231/255, alpha: 1).cgColor
        
        let colors = [colorA, colorB, colorC, colorD]
        return colors
    }
}
