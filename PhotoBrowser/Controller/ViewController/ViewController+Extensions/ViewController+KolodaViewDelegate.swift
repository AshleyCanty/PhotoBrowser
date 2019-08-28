//
//  ViewController+KolodaViewDelegate.swift
//  PhotoBrowser
//
//  Created by ashley canty on 8/27/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import UIKit
import Koloda


extension ViewController: KolodaViewDelegate {


    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .moderate
    }
    
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection) {
        resetLikeButton()
    }
    
    func koloda(_ koloda: KolodaView, allowedDirectionsForIndex index: Int) -> [SwipeResultDirection] {
        return [.left]
    }
    
    func koloda(_ koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
        let overlay = OverlayView()
        weakRefArray.addObject(overlay)
        return overlay
    }
}
