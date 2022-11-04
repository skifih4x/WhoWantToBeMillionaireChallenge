//
//  WinningViewController.swift
//  WhoWantToBeMillionaireChallenge
//
//  Created by Артем Галай on 31.10.22.
//

import UIKit

final class WinningViewController: UIViewController {

    private lazy var prizeTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(WinningCell.self, forCellReuseIdentifier: WinningCell.identifier)
        tableView.backgroundView = UIImageView(image: UIImage(named: "backgroundTableView"))
//        tableView.backgroundColor = .red
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private lazy var continueButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .green
        button.setTitle("ПРОДОЛЖИТЬ", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(continueTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
    }

    private func setupHierarchy() {
        view.addSubview(prizeTableView)
        view.addSubview(continueButton)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            prizeTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            prizeTableView.bottomAnchor.constraint(equalTo: continueButton.topAnchor, constant: -10),
            prizeTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            prizeTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),

            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            continueButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            continueButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    @objc func continueTapped() {
        // Переход на экран Сергея
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
        cell?.backgroundColor = .clear
        cell?.configure(model: WinModel.winModels[indexPath.row])
        cell?.actionHandler = { [weak self] cell in
            let alert = UIAlertController(title: "Поздравляем!",
                                          message: "Вы выиграли \(WinModel.winModels[indexPath.row].prize.rawValue)",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self] action in
                self?.navigationController?.popViewController(animated: true)
            }))
            self?.present(alert, animated: true)
        }
        return cell ?? UITableViewCell()
    }
}
