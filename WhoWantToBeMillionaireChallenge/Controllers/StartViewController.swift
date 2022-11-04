//
//  MainViewController.swift
//  WhoWantToBeMillionaireChallenge
//
//  Created by Артем Орлов on 30.10.2022.
//

import UIKit

class StartViewController: UIViewController {
    
    let imageView = UIImageView()
    let playButton = UIButton()
    let rulesButton = UIButton()
    
    let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg2L.jpg")!)
        style() // Красота
        layout()// Разметка
        
        
        
    }
    
    
}

extension StartViewController {
    private func style() {
        imageView.image = UIImage(named: "millionaire.png")
        
        playButton.setTitle("Играть", for: .normal)
        playButton.backgroundColor = .systemCyan
        playButton.layer.cornerRadius = 10
        playButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        rulesButton.setTitle("Правила", for: .normal)
        rulesButton.backgroundColor = .systemCyan
        rulesButton.layer.cornerRadius = 10
        rulesButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        rulesButton.addTarget(self, action:  #selector(rulesButtonTapped), for: .touchUpInside)
        
    }
    
    private func layout() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(playButton)
        stackView.addArrangedSubview(rulesButton)
        
        
        
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 280),
            imageView.widthAnchor.constraint(equalToConstant: 300),
            // Привязка по вертикали, по оси Y
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 20),
            // Привязка к ведущему(leading) краю экрана / Отступ на 8pt = 1, после ведущего якоря(констрейинта) view.leadingAnchor
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 7),
            // Привязка к заднему(trailing) краяю экрана / Отсуп
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 7),
            playButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        
        
    }
    
    
}

extension StartViewController {
    @objc func playButtonTapped(sender: UIButton) {
        print("Начали играть!")
        // present
    }
    
    @objc func rulesButtonTapped(sender: UIButton) {
        print("Правила!")
        let vc = RulesViewController()
        present(vc, animated: true)
    }
    
}
/*
import SwiftUI
struct PeopleVCProvider: PreviewProvider {
  static var previews: some View {
    Container().edgesIgnoringSafeArea(.all)
      .previewDevice("iPhone 13 Pro")
  }
  struct Container: UIViewControllerRepresentable {
    let startVC = StartViewController()
    func makeUIViewController(context: Context) -> some UIViewController {
      startVC
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
  }
}
*/

