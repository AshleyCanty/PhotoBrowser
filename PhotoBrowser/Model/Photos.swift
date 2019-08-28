//
//  Results.swift
//  PhotoBrowser
//
//  Created by ashley canty on 8/23/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import UIKit

struct Photos: Codable {
    var page: Int?
    var pages: Int?
    var perpage: Int?
    var total: Int?
    var photo: [PhotoDetails]?
}
