//
//  WinningViewController.swift
//  WhoWantToBeMillionaireChallenge
//
//  Created by Артем Галай on 31.10.22.
//

import UIKit

final class WinningViewController: UIViewController {
    
    private let playerAnswer: PlayerAnswer?
    private lazy var playerAnswerViewModel: PlayerAnswerViewModel? = {
        guard let playerAnswer = playerAnswer else {
            return nil
        }
        return convert(model: playerAnswer)
    }()
    
    private let backgroundView: UIImageView = {
        let imageViewBackground = UIImageView(frame: UIScreen.main.bounds)
        imageViewBackground.image = UIImage(named: "background")
        imageViewBackground.translatesAutoresizingMaskIntoConstraints = false
        return imageViewBackground
    }()
    
    private lazy var prizeTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(WinningCell.self, forCellReuseIdentifier: WinningCell.identifier)
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let serviceButtonsStackView = UIStackView()
    
    private lazy var continueButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("ПРОДОЛЖИТЬ", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(continueTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var takePrizeButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(takePrizeTapped), for: .touchUpInside)
        
        button.setTitle("", for: .normal)
        let image = UIImage(named: "money")
        button.setImage(image, for: .normal)
        button.contentMode = .scaleAspectFit
        
        return button
    }()
    
    init(playerAnswer: PlayerAnswer) {
        self.playerAnswer = playerAnswer
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
        
        if playerAnswerViewModel?.level == 0 {
            takePrizeTapped()
        }
    }
    
    private func convert(model: PlayerAnswer) -> PlayerAnswerViewModel {
        let level = WinModel.winModels.count - model.level
        
        if let isOK = model.result, isOK {
            let money = WinModel.winModels[level].prize.rawValue
            let title = level == 0 ? "Поздравляем, вы выиграли!" : "Вы забираете: \(money) денег"
            return PlayerAnswerViewModel(title: title, level: level, money: money)
        } else {
            let money = WinModel.winModels[level].safeMoney
            let title = "У вас все впереди! Вы забираете:"
            return PlayerAnswerViewModel(title: title, level: level, money: money)
        }
    }
    
    private func setupHierarchy() {
        view.addSubview(backgroundView)
        view.addSubview(prizeTableView)
        serviceButtonsStackView.translatesAutoresizingMaskIntoConstraints = false
        serviceButtonsStackView.spacing = 20
        [continueButton, takePrizeButton].forEach { item in
            item.translatesAutoresizingMaskIntoConstraints = false
            serviceButtonsStackView.addArrangedSubview(item)
        }
        takePrizeButton.setContentHuggingPriority(.required, for: .horizontal)
        view.addSubview(serviceButtonsStackView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            prizeTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            prizeTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            prizeTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            
            serviceButtonsStackView.topAnchor.constraint(equalTo: prizeTableView.bottomAnchor, constant: 20),
            serviceButtonsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            serviceButtonsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            serviceButtonsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            serviceButtonsStackView.heightAnchor.constraint(equalToConstant: 60),
            takePrizeButton.heightAnchor.constraint(equalTo: takePrizeButton.widthAnchor, multiplier: 1),
        ])
    }
    
    @objc func continueTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func takePrizeTapped() {
        let title = playerAnswerViewModel?.title
        let alert = UIAlertController(title: title, message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { [weak self] action in
            self?.navigationController?.popToRootViewController(animated: true)
        })
        present(alert, animated: true)
    }
}

extension WinningViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        WinModel.winModels.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        44
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WinningCell.identifier, for: indexPath) as? WinningCell
        let isCurrentLevel = playerAnswerViewModel?.level == indexPath.row
        cell?.configure(model: WinModel.winModels[indexPath.row], isCurrentLevel: isCurrentLevel)
        return cell ?? UITableViewCell()
    }
}
