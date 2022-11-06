//
//  QuestionFactoryProtocol.swift
//  MovieQuiz
//
//  Created by SERGEY SHLYAKHIN on 06.11.2022.
//

import Foundation

protocol QuestionFactoryProtocol {
    func requestNextQuestion(level: Int)
}
