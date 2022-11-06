//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by SERGEY SHLYAKHIN on 06.11.2022.
//

import Foundation

protocol QuestionFactoryDelegate: AnyObject {
    func didRecieveNextQuestion(_ questionFactory: QuestionFactoryProtocol, question: Question?)
}
