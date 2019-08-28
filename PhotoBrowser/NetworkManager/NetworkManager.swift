//
//  NetworkManager.swift
//  PhotoBrowser
//
//  Created by ashley canty on 8/23/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import Foundation


struct NetworkManager {
    
    let recentPhotosURL = "https://api.flickr.com/services/rest/?method=flickr.photos.getRecent&api_key=6904b866617f2858cc2fd51846ab4af9&format=json&nojsoncallback=1"
    
    static let shared = NetworkManager()
    
    // MARK: -- Fetch JSON from Flickr API
    
    func fetchRecentPhotos(completion: @escaping (([PhotoSource],_ error: NSError?,_ errorMessage: String?)->())) {
        
        guard let url = URL(string: recentPhotosURL) else { return }
        let err = NSError.createObject("")
        let urlRequest = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            guard error == nil else {
                return completion([], err, ErrorMessage.APIError.rawValue)
            }
            
            guard let jsonData = data else {
                return completion([], err, ErrorMessage.NilData.rawValue)
            }
            
            self.createJSONErrorObject(jsonData: jsonData, completion: { (didFail, errorMessage) in
                if !didFail {
                    self.createPhotoDetailObject(jsonData: jsonData, completion: { (photoSourceList) in
                        guard let list = photoSourceList else {
                            completion([], err, ErrorMessage.NilData.rawValue)
                            return
                        }
                        completion(list, nil, nil)
                        return
                    })
                    
                } else {
                    completion([], err, errorMessage)
                }
            })
        }
        
        task.resume()
    }
}

extension NetworkManager {
    
    // MARK: -- Parse JSON Response to detect error
    
    private func createJSONErrorObject(jsonData: Data, completion: @escaping (_ didFail: Bool, _ errorMessage: String?) -> ()) {
        let decoder = JSONDecoder()
        do {
            let results = try decoder.decode(JSONError.self, from: jsonData)
            
            if results.stat == "fail" {
                if let message = results.message {
                    completion(true, message)
                    return
                }
            }
            completion(false, nil)
            return
        } catch { print("Error: \(error.localizedDescription)") }

        completion(true, nil)
    }

    // MARK: -- Convert JSON to PhotoDetail & PhotoSource Objects
    
    private func createPhotoDetailObject(jsonData: Data, completion: @escaping (_ sourceList: [PhotoSource]?) -> ()) {
        let decoder = JSONDecoder()
        do {
            let resultsObject = try decoder.decode(Root.self, from: jsonData)
            let detailList = resultsObject.photos?.photo
            createPhotoSourceObjects(detailList: detailList) { (sourceList) in
                completion(sourceList)
            }
        } catch { print("Error: \(error.localizedDescription)") }
    }
    
    private func createPhotoSourceObjects(detailList: [PhotoDetails]?, completion: @escaping (_ sourceList: [PhotoSource]?) -> ()) {
        var sourceObjects: [PhotoSource] = []
        if let detailList = detailList {
            
            // Create a PhotoSource object using a PhotoDetail object and append to array
            for x in detailList {
                let newObject = PhotoSource(photoDetails: x)
                sourceObjects.append(newObject)
            }
            
            // PhotoSource array will be returned to ViewController
            completion(sourceObjects)
        }
    }
}
