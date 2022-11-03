//
//  GameViewContoller.swift
//  WhoWantToBeMillionaireChallenge
//
//  Created by Артем Орлов on 01.11.2022.
//

import UIKit

struct QuestionMain {
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

struct QuestionViewModel {
    let question: String
    let answersButtonsText: [String : String]
    let correctAnswerButton: UIButton?
    let correctAnswerLetter: String?
}

class GameViewContoller: UIViewController {
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "background")
        return imageView
    }()
    
    private let mainStackView = UIStackView()
    
    private let hintButtonsStackView = UIStackView()
    private let fiftyButton = UIButton()
    private let helpButton = UIButton()
    private let mistakeButton = UIButton()
    private let leftPaddingView = UIView()
    private let rightPaddingView = UIView()
    
    private let questionLabelView = UIView()
    private let questionLabel = UILabel()
    
    private let answerButtonsStackView = UIStackView()
    private let aButton = UIButton()
    private let bButton = UIButton()
    private let cButton = UIButton()
    private let dButton = UIButton()
    
    private let serviceStackView = UIStackView()
    private let takeMoneyButton = UIButton()
    private let timerView = UIView()
    private let moneyLabel = UILabel()
    
    // MARK: - Properties
    private var currentQuestion: QuestionMain? {
        didSet {
            guard let currentQuestion = currentQuestion else {
                return
            }
            questionViewModel = convert(model: currentQuestion)
            guard let questionViewModel = questionViewModel else {
                return
            }
            show(viewModel: questionViewModel)
        }
    }
    private var questionViewModel: QuestionViewModel?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        applyStyle()
        applyLayout()
        
        askQuestion()
    }
}

// MARK: - State's methods
extension GameViewContoller {
    private func askQuestion() {
        currentQuestion = getMockQuestion()
    }
    
    private func convert(model: QuestionMain) -> QuestionViewModel {
        let answers = model.answers.shuffled()
        var dir = [String : String]()
        var correctChar: String?
        
        for (key, value) in ["A", "B", "C", "D"].enumerated() {
            dir[value] = answers[key].answer
            if answers[key].isCorrect {
                correctChar = value
            }
        }
        
        let correctButton: UIButton?
        switch correctChar {
        case "A": correctButton = aButton
        case "B": correctButton = bButton
        case "C": correctButton = cButton
        case "D": correctButton = dButton
        default: correctButton = nil
        }
        
        return QuestionViewModel(question: model.text, answersButtonsText: dir, correctAnswerButton: correctButton, correctAnswerLetter: correctChar)
    }
    
    private func show(viewModel: QuestionViewModel) {
        questionLabel.text = viewModel.question
        aButton.setTitle(viewModel.answersButtonsText["A"], for: .normal)
        bButton.setTitle(viewModel.answersButtonsText["B"], for: .normal)
        cButton.setTitle(viewModel.answersButtonsText["C"], for: .normal)
        dButton.setTitle(viewModel.answersButtonsText["D"], for: .normal)
    }
}

// MARK: - Private methods setup and UI
extension GameViewContoller {
    private func setup() {
        aButton.addTarget(self, action: #selector(aButtonTapped), for: .primaryActionTriggered)
        bButton.addTarget(self, action: #selector(aButtonTapped), for: .primaryActionTriggered)
        cButton.addTarget(self, action: #selector(aButtonTapped), for: .primaryActionTriggered)
        dButton.addTarget(self, action: #selector(aButtonTapped), for: .primaryActionTriggered)
        
        fiftyButton.addTarget(self, action: #selector(fiftyButtonTapped), for: .primaryActionTriggered)
        helpButton.addTarget(self, action: #selector(helpButtonTapped), for: .primaryActionTriggered)
        mistakeButton.addTarget(self, action: #selector(mistakeButtonTapped), for: .primaryActionTriggered)
    }
    
    private func applyStyle() {
        applyStyleImageButton(for: fiftyButton, imageName: "fifty")
        applyStyleImageButton(for: helpButton, imageName: "auditory")
        applyStyleImageButton(for: mistakeButton, imageName: "call")
        
        questionLabelView.backgroundColor = .separator
        applyStyleLabel(for: questionLabel, text: "Мощность двигателя авто измеряют в ... силах")
        
        applyStyleAnswerButton(for: aButton, title: "Тараканьих", imageName: "a.circle.fill", alignment: .left)
        applyStyleAnswerButton(for: bButton, title: "Муравьиных", imageName: "b.circle.fill", alignment: .left)
        applyStyleAnswerButton(for: cButton, title: "Голубиных", imageName: "c.circle.fill", alignment: .left)
        applyStyleAnswerButton(for: dButton, title: "Лошадиных", imageName: "d.circle.fill", alignment: .left)
        
        applyStyleAnswerButton(for: takeMoneyButton, title: "Взять деньги")
        applyStyleLabel(for: moneyLabel, text: "$100", textColor: .systemYellow ,numberOfLines: 1)
    }
    
    private func applyLayout() {
        
        arrangeStackView(
            for: hintButtonsStackView,
               subviews: [leftPaddingView, fiftyButton, helpButton, mistakeButton, rightPaddingView]
        )
                
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabelView.addSubview(questionLabel)
        
        questionLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        
        arrangeStackView(
            for: answerButtonsStackView,
               subviews: [aButton, bButton, cButton, dButton],
               spacing: 10.0,
               axis: .vertical,
               distribution: .fillEqually
        )
                
        arrangeStackView(
            for: serviceStackView,
               subviews: [takeMoneyButton, moneyLabel],
               spacing: 20.0
        )
        
        moneyLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        arrangeStackView(
            for: mainStackView,
               subviews: [hintButtonsStackView, questionLabelView, answerButtonsStackView, serviceStackView],
               spacing: 10.0,
               axis: .vertical
        )
        
        [backgroundImageView, mainStackView].forEach { item in
            item.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(item)
        }
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            helpButton.heightAnchor.constraint(equalTo: helpButton.widthAnchor, multiplier: 2/3),
            fiftyButton.heightAnchor.constraint(equalTo: fiftyButton.widthAnchor, multiplier: 2/3),
            mistakeButton.heightAnchor.constraint(equalTo: mistakeButton.widthAnchor, multiplier: 2/3),
            leftPaddingView.widthAnchor.constraint(equalTo: rightPaddingView.widthAnchor),
            
            questionLabel.leadingAnchor.constraint(equalTo: questionLabelView.leadingAnchor, constant: 20),
            questionLabel.trailingAnchor.constraint(equalTo: questionLabelView.trailingAnchor, constant: -20),
            questionLabel.topAnchor.constraint(equalTo: questionLabelView.topAnchor),
            questionLabel.bottomAnchor.constraint(equalTo: questionLabelView.bottomAnchor),
            
            aButton.heightAnchor.constraint(equalToConstant: 32),
            
            serviceStackView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    // MARK: - Supporting methods
    private func applyStyleLabel(
        for label: UILabel,
        text: String,
        font: UIFont? = .preferredFont(forTextStyle: .title1),
        textColor: UIColor = .white,
        textAlignment: NSTextAlignment = .center,
        numberOfLines: Int = 0
    ) {
        label.text = text
        label.font = font
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textColor = textColor
        label.textAlignment = textAlignment
        label.numberOfLines = numberOfLines
    }
    
    private func applyStyleAnswerButton(for button: UIButton, title: String, imageName: String? = nil, alignment: UIControl.ContentHorizontalAlignment = .center) {
        
        var config = UIButton.Configuration.plain()
        config.title = title
        config.baseForegroundColor = .white
        
        if let imageName = imageName {
            let imageConfig = UIImage.SymbolConfiguration(textStyle: .title1, scale: .small)
            let image = UIImage(systemName: imageName, withConfiguration: imageConfig)?.withTintColor(.systemYellow, renderingMode: .alwaysOriginal)
            config.image = image
            config.imagePlacement = .leading
            config.imagePadding = 20
        }
        
        config.background.strokeWidth = 1
        config.background.strokeColor = .systemYellow
        config.background.backgroundColor = .systemFill
        
        config.cornerStyle = .large
        button.configuration = config
        
        button.contentHorizontalAlignment = alignment
    }
    
    private func applyStyleImageButton(for button: UIButton, imageName: String) {
        button.setTitle("", for: .normal)
        let image = UIImage(named: imageName)
        button.setImage(image, for: .normal)
        button.contentMode = .scaleAspectFit
    }
    
    private func arrangeStackView(
        for stackView: UIStackView,
        subviews: [UIView],
        spacing: CGFloat = 0,
        axis: NSLayoutConstraint.Axis = .horizontal,
        distribution: UIStackView.Distribution = .fill,
        aligment: UIStackView.Alignment = .fill
    ) {
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.distribution = distribution
        stackView.alignment = aligment
        
        subviews.forEach { item in
            item.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview(item)
        }
    }
}

// MARK: - Actions
extension GameViewContoller {
    @objc func aButtonTapped(sender: UIButton) {
        print("Нажата кнопка с ответом ...")
        
        [aButton, bButton, cButton, dButton].forEach { $0.isEnabled = false }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            guard let strongSelf = self else { return }
            let correctButton = strongSelf.questionViewModel?.correctAnswerButton
            if sender === correctButton {
                print("И это правильный ответ!")
            } else {
                print("Вы ответили неправильно(")
                sender.configuration?.background.backgroundColor = .systemRed
            }
            correctButton?.configuration?.background.backgroundColor = .systemGreen
        }
    }
    
    @objc func fiftyButtonTapped(sender: UIButton) {
        print("Делаем 50/50 ...")
        
        [aButton, bButton, cButton, dButton].forEach { $0.isEnabled = false }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.removeTwoButtons()
        }
        
        sender.isEnabled = false
    }
    
    private func removeTwoButtons() {
        guard let correctButton = questionViewModel?.correctAnswerButton else { return }
        let remainButton = [aButton, bButton, cButton, dButton]
            .filter { $0 != correctButton }
            .randomElement()
        guard let remainButton = remainButton else { return }
        [correctButton, remainButton].forEach { $0.isEnabled = true }
    }
    
    @objc func helpButtonTapped() {
        print("Делаем Помощь зала")
    }
    
    @objc func mistakeButtonTapped(sender: UIButton) {
        print("Делаем звонок умному другу ...")
        
        [aButton, bButton, cButton, dButton].forEach { $0.isEnabled = false }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.showCorrectAnswer()
        }
        
        sender.isEnabled = false
    }
    
    private func showCorrectAnswer() {
        guard let correctButton = questionViewModel?.correctAnswerButton,
              let message = correctButton.currentTitle?.uppercased()
        else { return }
        let alert = UIAlertController(title: "Друг ответил: " + message, message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: nil))
        present(alert, animated: true)
        correctButton.isEnabled = true
    }
}

// MARK: - Mock data
extension GameViewContoller {
    private func getMockQuestion() -> QuestionMain {
        let question = QuestionMain(
            q: "Способностью к быстрой смене ... славятся хамелеоны?",
            a: [
                (answer: "Цвета", isCorrect: true),
                (answer: "Размера", isCorrect: false),
                (answer: "Пола", isCorrect: false),
                (answer: "Убеждений", isCorrect: false)
            ],
            l: 1)
        return question
    }
}
