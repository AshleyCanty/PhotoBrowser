//
//  ViewController+KolodaViewDataSource.swift
//  PhotoBrowser
//
//  Created by ashley canty on 8/27/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import UIKit
import Koloda


extension ViewController: KolodaViewDataSource {
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        
        let imagePath = photoURLObjects[index].url
        let imageView = RoundedImageView()
        
        imageView.downloadImageFromCacheUsingURL(urlString: imagePath) { (image) in
            DispatchQueue.main.async {
                imageView.image = image
            }
        }
        
        if photoURLObjects.count > 0 {
            fadingTitle.text = photoURLObjects[index].title
            let name = NotificationName.FadeText.rawValue
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: name), object: nil)
        }
        
        return imageView
    }
    
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        if photoURLObjects.count > 0 { return photoURLObjects.count }
        return 0
    }
}
