//
//  SoundsModel.swift
//  WhoWantToBeMillionaireChallenge
//
//  Created by Марс Мазитов on 04.11.2022.
//

import Foundation
import AVFoundation

enum Sounds:String {
    case pickAnswer = "PickAnswer"
    case trueAnswer = "TrueAnswer"
    case falseAnswer = "FalseAnswer"
    case waitResults = "WaitResults"
    case win = "Win"
}

struct SoundsModel {
    var player: AVAudioPlayer?
    var correntSound = String()
    mutating func sound(_ pick: Sounds) {
        player?.stop()
        
        switch pick {
        case .pickAnswer:
            correntSound = "PickAnswer"
        case .trueAnswer:
            correntSound = "TrueAnswer"
        case .falseAnswer:
            correntSound = "FalseAnswer"
        case .waitResults:
            correntSound = "WaitResults"
        case .win:
            correntSound = "Win"
        }
        
        let url = Bundle.main.url(forResource: correntSound, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player!.play()
    }
    
    func stopSound() {
        player?.stop()
    }
}
