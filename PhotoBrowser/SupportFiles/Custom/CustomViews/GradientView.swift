//
//  GradientView.swift
//  PhotoBrowser
//
//  Created by ashley canty on 8/25/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import UIKit


class GradientView: UIView {
    
    var timer = Timer()
    var gradient = CAGradientLayer()
    let range: Range = 0.0 ..< 1.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func changeGradientColors() {
        self.gradient.colors = UIColor().getGradientColors()
    }
}


extension GradientView: CAAnimationDelegate {
    func setUpViews(){
        setGradientViews(gradient)
        self.layer.addSublayer(gradient)
    }
    
    func setGradientViews(_ gradient: CAGradientLayer) {
        gradient.frame = self.bounds
        gradient.colors = UIColor().getGradientColors()
        gradient.startPoint = CGPoint(x: 0, y: 1)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        gradient.locations = [0.0,0.35,0.70,0.99]
    }
}
