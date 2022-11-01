//
//  QuestionsViewController.swift
//  WhoWantToBeMillionaireChallenge
//
//  Created by Артем Галай on 1.11.22.
//

import UIKit

class QuestionsViewController: UIViewController {

    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Go", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
    }

    private func setupHierarchy() {
        view.addSubview(button)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 50)
            ])
    }

    @objc func buttonTapped() {
        navigationController?.pushViewController(WinningViewController(), animated: true)
        
    }
}
