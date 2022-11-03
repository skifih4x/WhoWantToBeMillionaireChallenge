//
//  WinningViewController.swift
//  WhoWantToBeMillionaireChallenge
//
//  Created by Артем Галай on 31.10.22.
//

import UIKit

class WinningViewController: UIViewController {

    private lazy var prizeTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(WinningCell.self, forCellReuseIdentifier: WinningCell.identifier)
        tableView.backgroundView = UIImageView(image: UIImage(named: "backgroundTableView"))
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
    }

    private func setupHierarchy() {
        view.addSubview(prizeTableView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            prizeTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            prizeTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            prizeTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            prizeTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
    }
}

extension WinningViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        WinModel.winModels.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WinningCell.identifier, for: indexPath) as? WinningCell
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
