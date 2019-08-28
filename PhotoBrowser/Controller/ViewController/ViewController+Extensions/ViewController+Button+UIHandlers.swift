//
//  ViewController+Button+UIHandlers.swift
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
    
    // MARK: -- UI Update & UIButton Handlers
    @objc func likeButtonDidTap() {
        let currentIndex = kolodaView.currentCardIndex
        
        // 0 = Unlike, 1 = Like
        if likeButton.tag == 0 {
            if let overlayObject = weakRefArray.object(at: currentIndex) as? OverlayView {
                overlayObject.customOverlay()
                likeButton.tag = 1
            }
        } else {
            if let overlayObject = weakRefArray.object(at: currentIndex) as? OverlayView {
                overlayObject.clearOverlay()
                likeButton.tag = 0
            }
        }
    }
    
    func resetLikeButton() {
        likeButton.isSelected = false
        likeButton.tag = 0
    }
    
    @objc func fadeText() {
        fadingTitle.alpha = 0
        UIView.animate(withDuration: 0.6, animations: {
            self.fadingTitle.alpha = 1
        }, completion: nil)
    }
    
    func presentAlert(_ errorMessage: String){
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Oops!", message: errorMessage, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { (_) in
                self.navigationController?.popViewController(animated: true)
            }))
            self.present(alert, animated: true)
        }
    }
    
    func updateUIAfterDataRetrieval() {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut, animations: {
                self.containerView.alpha = 1
                self.likeButton.alpha = 1
                self.likeButton.layer.opacity = 1
            }, completion: { (done) in
                UIView.animate(withDuration: 0.5, animations: {
                    self.activityIndicatorView.alpha = 0
                }, completion: { (_) in
                    self.activityIndicatorView.removeFromSuperview()
                })
            })
            
            self.kolodaView.reloadData()
        }
    }
}
