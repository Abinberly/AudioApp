//
//  Item.swift
//  AudioApp
//
//  Created by Abin Berly on 04/07/26.
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
