
//
//  FileStorageService.swift
//  AudioApp
//
//  Created by Abin Berly on 04/07/26.
//

import Foundation

final class FileStorageService {

    func recordingsDirectory() -> URL {
        FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask
        ).first!
    }
}
