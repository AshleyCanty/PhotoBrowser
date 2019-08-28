//
//  NSError+Extensions.swift
//  PhotoBrowser
//
//  Created by ashley canty on 8/27/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import Foundation

extension NSError {
    static func createObject(_ domain: String) -> NSError {
        return NSError(domain: domain, code: 0, userInfo: nil)
    }
}
