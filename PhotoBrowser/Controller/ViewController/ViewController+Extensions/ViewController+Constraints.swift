//
//  ViewController+Constraints.swift
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
    
    // MARK: -- Constraints
    func setUpAutoLayout() {
        var containerViewMargin: Int
        var kolodaViewMargin: Int
        
        if DeviceSize.iPhoneScreenSizes() == .iPad {
            containerViewMargin = 36
            kolodaViewMargin = 66
        } else {
            containerViewMargin = 12
            kolodaViewMargin = 25
        }
        
        let group = [
            
            // Set constraints for OpaqueWrapper
            // Stretches full width to prevent KolodaView from getting clipped
            opaqueWrapper.m_left |=| view.m_left,
            opaqueWrapper.m_right |=| view.m_right,
            opaqueWrapper.m_centerY |=| view.m_centerY - 30,
            opaqueWrapper.m_height |=| (view.frame.height * 2/3) - 50,
            
            // Set constraints for ContainerView
            containerView.m_left |=| opaqueWrapper.m_left + containerViewMargin,
            containerView.m_right |=| opaqueWrapper.m_right - containerViewMargin,
            containerView.m_height |=| view.frame.height * 2/3,
            containerView.m_centerY |=| opaqueWrapper.m_centerY,
            
            // Set constraints for ShadowView
            shadowView.m_left |=| containerView.m_left,
            shadowView.m_right |=| containerView.m_right,
            shadowView.m_top |=| containerView.m_top,
            shadowView.m_bottom |=| containerView.m_bottom,
            
            // Set constraints for MainView
            mainView.m_left |=| containerView.m_left,
            mainView.m_right |=| containerView.m_right,
            mainView.m_top |=| containerView.m_top,
            mainView.m_bottom |=| containerView.m_bottom,
            
            // Set constraints for PhotoTitle
            fadingTitle.m_left |=| mainView.m_left + 20,
            fadingTitle.m_right |=| mainView.m_right - 20,
            fadingTitle.m_top |=| kolodaView.m_bottom,
            fadingTitle.m_bottom |=| mainView.m_bottom,
            
            // Set constraints for KolodaView
            kolodaView.m_left |=| view.m_left + kolodaViewMargin,
            kolodaView.m_right |=| view.m_right - kolodaViewMargin,
            kolodaView.m_top |=| opaqueWrapper.m_top - 60,
            kolodaView.m_height |=| ((view.frame.height * 2/3) - 70),
        ]
        
        group.activate()
    }
    
    func setUpLikeButtonConstraints() {
        let width = getLikeButtonWidth()
        let group = [
            likeButton.m_width |=| width,
            likeButton.m_height |=| width,
            likeButton.m_centerX |=| view.m_centerX,
            likeButton.m_top |=| opaqueWrapper.m_bottom + (likeButton.frame.height)
        ]
        
        group.activate()
    }
}
