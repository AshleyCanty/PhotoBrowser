//
//  ViewController+Subviews.swift
//  PhotoBrowser
//
//  Created by ashley canty on 8/27/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import UIKit
import Mortar
import Koloda
import MarqueeLabel
import NVActivityIndicatorView
import WCLShineButton


extension ViewController {
    
    // MARK: -- Subviews
    func addSubviews() {
        view |+| [
            opaqueWrapper |+| [
                containerView |+| [
                    shadowView |+| [
                        mainView |+| [
                            fadingTitle
                        ]
                    ]
                ]
            ],
            kolodaView
        ]
    }
    
    func addIndicatorView() {
        view.addSubview(activityIndicatorView)
        view.bringSubviewToFront(activityIndicatorView)
        activityIndicatorView.center = view.center
        activityIndicatorView.center.y -= 50
        activityIndicatorView.startAnimating()
    }

    func addTitleLabel() {
        fadingTitle.textColor = UIColor.black.withAlphaComponent(0.75)
        fadingTitle.font = UIFont(name: Font.HelveticaNueueMedium.rawValue, size: 23)
        let notificationCenter = NotificationCenter.default
        let name = NotificationName.FadeText.rawValue
        notificationCenter.addObserver(self, selector: #selector(fadeText), name:NSNotification.Name(rawValue: name), object: nil)
    }
    
    func getLikeButtonWidth() -> Int {
        var buttonWidth: Int
        if DeviceSize.iPhoneScreenSizes() == .iPad {
            buttonWidth = 65
        } else {
            buttonWidth = 50
        }
        return buttonWidth
    }
    
    
    func addLikeButton() {
        let width = getLikeButtonWidth()
        var param1 = WCLShineParams()
        likeButton = WCLShineButton(frame: .init(x: 0, y: 0, width: width, height: width), params: param1)
        param1.bigShineColor = Color.GreenLight
        param1.smallShineColor = Color.PurpleLight
        likeButton.alpha = 0
        likeButton.fillColor = Color.GreenLight
        likeButton.color = Color.PurpleDark
        likeButton.addTarget(self, action: #selector(likeButtonDidTap), for: .touchUpInside)
        likeButton.tag = 0
        
        view.addSubview(likeButton)
        view.bringSubviewToFront(likeButton)
        setUpLikeButtonConstraints()
    }
}
