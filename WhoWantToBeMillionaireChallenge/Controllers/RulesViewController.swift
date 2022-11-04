//
//  RulesViewController.swift
//  WhoWantToBeMillionaireChallenge
//
//  Created by Артем Орлов on 01.11.2022.
//

import UIKit

class RulesViewController: UIViewController {
    // Title(Правила игры)
    let titleLabel = UILabel()
    // Кнокпа "Назад"
    let backButton = UIButton()
    let scroll = UIScrollView()
    let contentView = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.jpg")!)
        
        style() // Красота
        layout()// Разметка
    }
}

extension RulesViewController {
    private func style() {
        backButton.backgroundColor = .systemCyan
        
        titleLabel.text = "Правила игры"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 25)
        
        contentView.text = """
    "Игра Кто хочет стать миллионером? - это конкурс викторина, в котором участники должны правильно ответить на ряд вопросов с несколькими вариантами ответов, чтобы перейти на следующий уровень. Всего 15 вопросов, каждый вопрос стоит определенной суммы денег, участники не имеют никаких временных ограничений для предоставления ответа. Участники также получают три вида подсказок, чтобы помочь себе, если они застряли на конкретном вопросе.
        
    Вопросы “Кто хочет стать миллионером?” структурированы в соответствии с пятью различными уровнями, причем уровень сложности постепенно увеличивается. Каждый уровень содержит три вопроса.

    Вопросы, сгруппированные на одном уровне, будут иметь одинаковую сложность. Например: вопросы 1-3 составляют первый уровень и будут содержать самые простые вопросы. Второй уровень (вопросы 4–6) будет несколько сложнее, за ним следует третий уровень (вопросы 7–9). Четвертый уровень (вопросы 10–12) будет состоять из действительно сложных вопросов, за которыми следует пятый и последний уровень (вопросы 13–15), имеющий самые сложные вопросы в игре.

    Важно помнить, что вопросы, составляющие каждый уровень, не обязательно будут относиться к одним и тем же или даже сходным темам, но их общий уровень сложности будет одинаковым. Немаловажно, что уровни вопросов не следует путать с «несгораемыми суммами» или структурой ценностей вопросов, что они собой являют объясняется ниже.

    Важно помнить, что вопросы, составляющие каждый уровень, не обязательно будут относиться к одним и тем же или даже сходным темам, но их общий уровень сложности будет одинаковым. Немаловажно, что уровни вопросов не следует путать с «несгораемыми суммами» или структурой ценностей вопросов, что они собой являют объясняется ниже.

    Вопрос 1 100 руб.
    Вопрос 2 200 руб.
    Вопрос 3 300 руб.
    Вопрос 4 500 руб.
    Вопрос 5 - 1000 руб. Несгораемая сумма.

    Если участники неправильно отвечают на последний вопрос вопрос, то они уходят ни с чем. Если на этот вопрос дан правильный ответ, участникам гарантируется 1000 рублей, даже если дадут неверный ответ до достижения следующей несгораемой суммы в десятом вопросе.

    Вопрос 6 2000 руб.
    Вопрос 7 4000 руб.
    Вопрос 8 8000 руб.
    Вопрос 9 16 000 руб.
    Вопрос 10 - 32 000 руб. Несгораемая сумма.

    Если участники неправильно ответят на этот вопрос, они уйдут с 1000 рублей. Если на этот вопрос ответили верно, игрокам гарантируется 32 000 рублей, даже если дадут неверный ответ до достижения вопроса 15.

    Вопрос 11 64 000 руб.
    Вопрос 12 125 000 руб.
    Вопрос 13 250 000 руб.
    Вопрос 14 500 000 руб.
    Вопрос 15 - 1 000 000 руб.

    Подсказки
    Участникам разрешается применить три подсказки, которые они могут использовать в любой момент викторины. Каждая из подсказок может быть использована только один раз.

    50/50 - исключает два неправильных ответа из множественного выбора, оставляя участнику только один правильный и один неправильный вариант. Это означает, что у него есть шанс 50/50.

    Задать вопрос аудитории - залу задают тот же вопрос, что и участнику, и проводится быстрый опрос, чтобы показать их ответы. На диаграмме показывается явное преимущество определенного варианта, эта подсказка может быть чрезвычайно полезной. Участнику дается возможность согласиться с результатами, полученными от аудитории.

    Позвоните другу - участникам разрешается сделать 30-секундный звонок другу или члену семьи и спросить, знают ли они ответ на вопрос.


"""
        
        contentView.textColor = .white
        contentView.numberOfLines = 0
        contentView.sizeToFit()
        
        backButton.setTitle("Назад", for: .normal)
        backButton.layer.cornerRadius = 5
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        scroll.backgroundColor = .orange
        scroll.layer.cornerRadius = 20
        
    }
    
    private func layout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        scroll.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scroll)
        scroll.addSubview(contentView)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backButton)
        
        
        NSLayoutConstraint.activate([
            //Правила игры
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 10),
            
            
//            scroll.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 20),
//            scroll.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
//            view.trailingAnchor.constraint(equalToSystemSpacingAfter: scroll.trailingAnchor, multiplier: 2),
//
//            contentView.widthAnchor.constraint(equalTo: scroll.widthAnchor),
//            scroll.heightAnchor.constraint(equalToConstant: 500),

            contentView.leftAnchor.constraint(equalToSystemSpacingAfter: scroll.leftAnchor, multiplier: 2),
            scroll.rightAnchor.constraint(equalToSystemSpacingAfter: contentView.rightAnchor, multiplier: -2),

            contentView.widthAnchor.constraint(equalTo: scroll.widthAnchor),

            scroll.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scroll.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            scroll.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 1/3),
            scroll.heightAnchor.constraint(equalToConstant: 500),
            
            
            // Кнопка
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: backButton.bottomAnchor, multiplier: 10),
            backButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 7),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: backButton.trailingAnchor, multiplier: 7),
            backButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    
}

extension RulesViewController {
    @objc func backButtonTapped(sender: UIButton) {
        dismiss(animated: true)
        // present
    }
    
}

//textView(stackView) прижать к safeArea
//present, dismiss
