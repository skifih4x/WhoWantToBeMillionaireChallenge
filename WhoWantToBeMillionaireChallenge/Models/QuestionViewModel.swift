//
//  QuestionViewModel.swift
//  WhoWantToBeMillionaireChallenge
//
//  Created by SERGEY SHLYAKHIN on 06.11.2022.
//

import UIKit

struct QuestionViewModel {
    let question: String
    let answersButtonsText: [String : String]
    let correctAnswerButton: UIButton?
    let correctAnswerLetter: String?
    var remainAnswerButton: UIButton? = nil
    var remainAnswerLetter: String? = nil
    
    init(q: String, answers: [String : String], cButton: UIButton?, cLetter: String?) {
        question = q
        answersButtonsText = answers
        correctAnswerButton = cButton
        correctAnswerLetter = cLetter
    }
}
