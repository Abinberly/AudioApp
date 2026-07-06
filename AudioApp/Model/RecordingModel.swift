//
//  RecordingModel.swift
//  AudioApp
//
//  Created by Abin Berly on 04/07/26.
//

import Foundation
import SwiftData

@Model
final class RecordingModel {

    var id: UUID
    var title: String
    var filePath: String
    var duration: Double
    var createdAt: Date

    init(
        title: String,
        filePath: String,
        duration: Double = 0
    ) {
        self.id = UUID()
        self.title = title
        self.filePath = filePath
        self.duration = duration
        self.createdAt = .now
    }
    
    var url: URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent(filePath)
    }
}
