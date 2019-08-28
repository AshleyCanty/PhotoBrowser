//
//  JSONError.swift
//  PhotoBrowser
//
//  Created by ashley canty on 8/27/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import Foundation

struct JSONError: Codable {
    var stat: String?
    var code: Int?
    var message: String?
}
