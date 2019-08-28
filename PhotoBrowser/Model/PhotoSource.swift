//
//  PhotoURL.swift
//  PhotoBrowser
//
//  Created by ashley canty on 8/25/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import UIKit

struct PhotoSource {
    
    let photoDetails: PhotoDetails
    private(set) var url: String = ""
    private(set) var title: String = ""
    
    init(photoDetails: PhotoDetails) {
        self.photoDetails = photoDetails
        updateProperties()
    }
    
    private mutating func updateProperties() {
        url = setURL(photoDetails: photoDetails)
        title = setTitle(photoDetails: photoDetails)
    }
}

extension PhotoSource {
    
    private func setURL(photoDetails: PhotoDetails) -> String {
        guard let farmID = photoDetails.farm, let serverID = photoDetails.server, let ID = photoDetails.id, let secret = photoDetails.secret else { return "" }
        let url = "https://farm\(farmID).staticflickr.com/\(serverID)/\(ID)_\(secret).jpg"
        
        return url
    }
    
    private func setTitle(photoDetails: PhotoDetails) -> String {
        guard let title = photoDetails.title else { return "" }
        return title
    }
}
