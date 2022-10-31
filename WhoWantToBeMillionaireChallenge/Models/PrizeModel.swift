//
//  PrizeModel.swift
//  WhoWantToBeMillionaireChallenge
//
//  Created by Артем Галай on 31.10.22.
//

import Foundation

enum Prize: String {
    case one = "100"
    case two = "200"
    case three = "300"
    case four = "500"
    case five = "1000"
    case six = "2000"
    case seven = "4000"
    case eight = "8000"
    case nine = "16000"
    case ten = "32000"
    case eleven = "64000"
    case twelve = "125000"
    case thirteen = "250000"
    case fourteen = "500000"
    case fifteen = "МИЛЛИОН"
}

enum Number: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case ten = "10"
    case eleven = "11"
    case twelve = "12"
    case thirteen = "13"
    case fourteen = "14"
    case fifteen = "15"
}

struct WinModel {
    var number: Number
    var prize: Prize
}

extension WinModel {
    static var winModels: [WinModel] = [
        WinModel(number: Number.fifteen, prize: Prize.fifteen),
        WinModel(number: Number.fourteen, prize: Prize.fourteen),
        WinModel(number: Number.thirteen, prize: Prize.thirteen),
        WinModel(number: Number.twelve, prize: Prize.twelve),
        WinModel(number: Number.eleven, prize: Prize.eleven),
        WinModel(number: Number.ten, prize: Prize.ten),
        WinModel(number: Number.nine, prize: Prize.nine),
        WinModel(number: Number.eight, prize: Prize.eight),
        WinModel(number: Number.seven, prize: Prize.seven),
        WinModel(number: Number.six, prize: Prize.six),
        WinModel(number: Number.five, prize: Prize.five),
        WinModel(number: Number.four, prize: Prize.four),
        WinModel(number: Number.three, prize: Prize.three),
        WinModel(number: Number.two, prize: Prize.two),
        WinModel(number: Number.one, prize: Prize.one)
    ]
}
