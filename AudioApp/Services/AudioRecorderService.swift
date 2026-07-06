//
//  AudioRecorderService.swift
//  AudioApp
//
//  Created by Abin Berly on 04/07/26.
//

import Foundation
import AVFoundation
import Speech
import Combine
import UIKit

enum Chatstate {
    case idle
    case recording
    case playAudio
    
    var description: String {
        switch self {
        case .idle: return "Start Recording..."
        case .recording: return "Recording..."
        case .playAudio: return "Audio playing......."
        }
    }
}

@MainActor
class AudioRecorderService: NSObject, ObservableObject {
    
    // MARK: - Variables
    @Published var state: Chatstate = .idle
    @Published var dbLevel: CGFloat = 0.0
    @Published var hasMicPermission: Bool = false
    @Published var currentPlayingID: UUID?
    
    var onRecordingFinished: ((_ fileName: String, _ date: Date, _ duration: TimeInterval) -> Void)?
    
    // Recording
    private let audioEngine = AVAudioEngine()
    private var audioFile: AVAudioFile?
    private var currentRecordingURL: URL?
    private var recordingStartTime: Date?
    
    // Player
    private var audioPlayer: AVAudioPlayer?
    
    // Haptics
    private let impactGenerator = UIImpactFeedbackGenerator(style: .medium)
    private let notificationGenerator = UINotificationFeedbackGenerator()
    
    override init() {
        super.init()
        setupAudioSession()
        Task {
            await requestPermissions()
        }
        
    }

    // MARK: - Functions
    // Session setup
    private func setupAudioSession() {
        do {
            let audioSession = AVAudioSession.sharedInstance()
            try audioSession.setCategory(.playAndRecord, mode: .default, options: [.defaultToSpeaker, .allowBluetoothHFP, .allowBluetoothA2DP])
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        } catch {
            print("Failed to setup Audio Session: \(error.localizedDescription)")
        }
    }
    
    func requestPermissions() async {
        
        let recordAuthorized = await AVAudioApplication.requestRecordPermission()
        
        hasMicPermission = recordAuthorized
    }
    
    // Recording
    func startRecording() {

    }

    func stopRecording() {

    }
}
