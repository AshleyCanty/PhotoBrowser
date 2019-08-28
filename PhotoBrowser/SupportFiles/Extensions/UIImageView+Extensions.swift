//
//  ImageView+Extensions.swift
//  PhotoBrowser
//
//  Created by ashley canty on 8/26/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import UIKit



extension UIImageView {
    
    typealias ImageCacheLoaderCompletionHandler = ((UIImage) -> ())
    
    func downloadImageFromCacheUsingURL(urlString: String, completion: @escaping ImageCacheLoaderCompletionHandler) {
        
        guard let url = URL(string: urlString) else { return }
        guard let imageFromCache = ViewController.imageCache.object(forKey: urlString as AnyObject) else {
            do {
                let urlRequest = URLRequest(url: url)
                let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                    if let data = data {
                        
                        var resData: Data
                        if DeviceSize.iPhoneScreenSizes() == .iPad {
                            guard let highResData = UIImage(data: data)?.jpeg(.highest) else { return }
                            resData = highResData
                        } else {
                            guard let medResData = UIImage(data: data)?.jpeg(.medium) else { return }
                            resData = medResData
                        }
                        
                        guard let resImage = UIImage(data: resData) else { return }
                        ViewController.imageCache.setObject(resImage, forKey: urlString as AnyObject)
                        
                        DispatchQueue.main.async {
                            self.image = resImage
                            completion(resImage)
                        }
                    }
                }
                DispatchQueue.global(qos: .background).async {
                    task.resume()
                }
            }
            return
        }
        
        let cachedImage = imageFromCache as! UIImage
        DispatchQueue.main.async {
            self.image = cachedImage
            completion(cachedImage)
        }
    }
}
