//
//  GameViewContoller.swift
//  WhoWantToBeMillionaireChallenge
//
//  Created by Артем Орлов on 01.11.2022.
//

import UIKit

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
        applyStyleLabel(for: questionLabel, text: "Мощность двигателя авто измеряют в ... силах Мощность двигателя авто измеряют в ... силах Мощность двигателя авто измеряют в ... силах")
        
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
    @objc func aButtonTapped() {
        print("Нажата кнопка с ответом")
    }
    
    @objc func fiftyButtonTapped() {
        print("Делаем 50/50")
    }
    
    @objc func helpButtonTapped() {
        print("Делаем Помощь зала")
    }
    
    @objc func mistakeButtonTapped() {
        print("Делаем Есть возможность ошибиться")
    }
}
