//
//  PrizeModel.swift
//  WhoWantToBeMillionaireChallenge
//
//  Created by Артем Галай on 31.10.22.
//
import UIKit

enum Prize: String {
    case one = "100"
    case two = "200"
    case three = "300"
    case four = "500"
    case five = "1 000"
    case six = "2 000"
    case seven = "4 000"
    case eight = "8 000"
    case nine = "16 000"
    case ten = "32 000"
    case eleven = "64 000"
    case twelve = "125 000"
    case thirteen = "250 000"
    case fourteen = "500 000"
    case fifteen = "1 000 000"
}
struct WinModel {
    var prize: Prize
    var backgroundcolorLabel: UIColor?
}

extension WinModel {
    static var winModels: [WinModel] = [
        WinModel(prize: Prize.fifteen, backgroundcolorLabel: #colorLiteral(red: 0.8990883231, green: 0.9641856551, blue: 0, alpha: 1).withAlphaComponent(0.5)),
        WinModel(prize: Prize.fourteen, backgroundcolorLabel: #colorLiteral(red: 0.1559615731, green: 0.2938378453, blue: 1, alpha: 1).withAlphaComponent(0.5)),
        WinModel(prize: Prize.thirteen, backgroundcolorLabel: #colorLiteral(red: 0.1559615731, green: 0.2938378453, blue: 1, alpha: 1).withAlphaComponent(0.5)),
        WinModel(prize: Prize.twelve, backgroundcolorLabel: #colorLiteral(red: 0.1559615731, green: 0.2938378453, blue: 1, alpha: 1).withAlphaComponent(0.5)),
        WinModel(prize: Prize.eleven, backgroundcolorLabel: #colorLiteral(red: 0.1559615731, green: 0.2938378453, blue: 1, alpha: 1).withAlphaComponent(0.5)),
        WinModel(prize: Prize.ten, backgroundcolorLabel: .systemMint.withAlphaComponent(0.5)),
        WinModel(prize: Prize.nine, backgroundcolorLabel: #colorLiteral(red: 0.1559615731, green: 0.2938378453, blue: 1, alpha: 1).withAlphaComponent(0.5)),
        WinModel(prize: Prize.eight, backgroundcolorLabel: #colorLiteral(red: 0.1559615731, green: 0.2938378453, blue: 1, alpha: 1).withAlphaComponent(0.5)),
        WinModel(prize: Prize.seven, backgroundcolorLabel: #colorLiteral(red: 0.1559615731, green: 0.2938378453, blue: 1, alpha: 1).withAlphaComponent(0.5)),
        WinModel(prize: Prize.six, backgroundcolorLabel: #colorLiteral(red: 0.1559615731, green: 0.2938378453, blue: 1, alpha: 1).withAlphaComponent(0.5)),
        WinModel(prize: Prize.five, backgroundcolorLabel: .systemMint.withAlphaComponent(0.5)),
        WinModel(prize: Prize.four, backgroundcolorLabel: #colorLiteral(red: 0.1559615731, green: 0.2938378453, blue: 1, alpha: 1).withAlphaComponent(0.5)),
        WinModel(prize: Prize.three, backgroundcolorLabel: #colorLiteral(red: 0.1559615731, green: 0.2938378453, blue: 1, alpha: 1).withAlphaComponent(0.5)),
        WinModel(prize: Prize.two, backgroundcolorLabel: #colorLiteral(red: 0.1559615731, green: 0.2938378453, blue: 1, alpha: 1).withAlphaComponent(0.5)),
        WinModel(prize: Prize.one, backgroundcolorLabel: #colorLiteral(red: 0.1559615731, green: 0.2938378453, blue: 1, alpha: 1).withAlphaComponent(0.5))
    ]
}
