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
    case fifty = "Fifty"
    case voting = "AuditoryVoting"
    case call = "Call"
}

struct SoundsModel {
    private var player: AVAudioPlayer?
    private var helpPlayer: AVAudioPlayer?
    private var currentSound = String()
    
    mutating func sound(_ pick: Sounds) {
        
        switch pick {
        case .pickAnswer:
            currentSound = Sounds.pickAnswer.rawValue
        case .trueAnswer:
            currentSound = Sounds.trueAnswer.rawValue
        case .falseAnswer:
            currentSound = Sounds.falseAnswer.rawValue
        case .waitResults:
            currentSound = Sounds.waitResults.rawValue
        case .win:
            currentSound = Sounds.win.rawValue
        case .fifty:
            let urlFifty = Bundle.main.url(forResource: Sounds.fifty.rawValue, withExtension: "mp3")
            helpPlayer = try! AVAudioPlayer(contentsOf: urlFifty!)
            helpPlayer!.play()
            return
        case .voting:
            let urlVoting = Bundle.main.url(forResource: Sounds.voting.rawValue, withExtension: "mp3")
            helpPlayer = try! AVAudioPlayer(contentsOf: urlVoting!)
            helpPlayer!.play()
            return
        case .call:
            let urlVoting = Bundle.main.url(forResource: Sounds.call.rawValue, withExtension: "mp3")
            helpPlayer = try! AVAudioPlayer(contentsOf: urlVoting!)
            helpPlayer!.play()
            return
        }
        helpPlayer?.stop()
        player?.stop()
        let url = Bundle.main.url(forResource: currentSound, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player!.play()
    }
    
    func stopMainSound() {
        player?.stop()
    }
    
    func stopHelpSound() {
        helpPlayer?.stop()
    }
}
