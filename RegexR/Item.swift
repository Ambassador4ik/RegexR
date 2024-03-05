//
//  Item.swift
//  RegexR
//
//  Created by Ambassador4ik on 3/5/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
