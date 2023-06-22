//
//  Item.swift
//  ibismac
//
//  Created by Ethan Eswaran on 22/6/2023.
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
