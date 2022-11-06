//
//  Question.swift
//  WhoWantToBeMillionaireChallenge
//
//  Created by Артем Орлов on 01.11.2022.
//

struct Question {
    typealias typeQuestion = (answer: String, isCorrect: Bool)
    let text: String
    let answers: [typeQuestion]
    let level: Int
    
    init(q: String, a: [typeQuestion], l: Int) {
        text = q
        answers = a
        level = l
    }
}
