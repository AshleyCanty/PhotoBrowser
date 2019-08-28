//
//  PhotoDetails.swift
//  PhotoBrowser
//
//  Created by ashley canty on 8/23/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import UIKit

struct PhotoDetails: Codable {
    let id: String?
    let owner: String?
    let secret: String?
    let server: String?
    let farm: Int?
    let title: String?
    let ispublic: Int?
    let isfriend: Int?
    let isfamily: Int?
}
