//
//  Extensions.swift
//  WBProject
//
//  Created by Shawn Miller on 4/8/19.
//  Copyright © 2019 Shawn Miller. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {
    mutating func removeDuplicates() {
        var result = [Element]()
        for value in self {
            if !result.contains(value) {
                result.append(value)
            }
        }
        self = result
    }
}
