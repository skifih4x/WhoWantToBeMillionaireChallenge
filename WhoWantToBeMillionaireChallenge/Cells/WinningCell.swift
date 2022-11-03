//
//  WinningCell.swift
//  WhoWantToBeMillionaireChallenge
//
//  Created by Артем Галай on 31.10.22.
//

import UIKit

class WinningCell: UITableViewCell {

    var actionHandler: ((WinningCell) -> Void)?
    @objc func takePrizeTapped() {
            actionHandler?(self)
        }

    static let identifier = "WinningCell"

    private let numberLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.text = "1"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let prizeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22)
        label.text = "100"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let coinImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "coin")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var takePrizeButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .green
        button.setTitle("ЗАБРАТЬ", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(takePrizeTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

//    private let backgroundImage: UIImageView = {
//        let imageView = UIImageView()
//        imageView.backgroundColor = .clear
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        return imageView
//    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupHierarchy() {
//        addSubview(backgroundImage)
        contentView.addSubview(numberLabel)
        contentView.addSubview(prizeLabel)
        contentView.addSubview(coinImage)
        contentView.addSubview(takePrizeButton)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
//            backgroundImage.topAnchor.constraint(equalTo: topAnchor, constant: 0),
//            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
//            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
//            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),

            numberLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            numberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),

            prizeLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            prizeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            coinImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            coinImage.trailingAnchor.constraint(equalTo: takePrizeButton.leadingAnchor),
            coinImage.heightAnchor.constraint(equalToConstant: 50),
            coinImage.widthAnchor.constraint(equalToConstant: 50),

            takePrizeButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            takePrizeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            takePrizeButton.heightAnchor.constraint(equalToConstant: 35),
            takePrizeButton.widthAnchor.constraint(equalToConstant: 90),
        ])
    }



    func configure(model: WinModel) {
        numberLabel.text = model.number.rawValue
        prizeLabel.text = model.prize.rawValue
    }
}
