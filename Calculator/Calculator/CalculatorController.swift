//
//  ViewController.swift
//  Calculator
//
//  Created by Kiryl on 5.08.25.
//

import UIKit

class CalculatorController: UIViewController {
    
    let calcLabel = UILabel()
    let smallLabel = UILabel()
    
    // Первый ряд
    let acButton = UIButton()
    let plusMinusButton = UIButton()
    let percentButton = UIButton()
    let divideButton = UIButton()
    
    // Второй ряд
    let sevenButton = UIButton()
    let eightButton = UIButton()
    let nineButton = UIButton()
    let multiplyButton = UIButton()
    
    // Третий ряд
    let fourButton = UIButton()
    let fiveButton = UIButton()
    let sixButton = UIButton()
    let minusButton = UIButton()
    
    // Четвертый ряд
    let oneButton = UIButton()
    let twoButton = UIButton()
    let threeButton = UIButton()
    let plusButton = UIButton()
    
    // Пятый ряд
    let calcButton = UIButton()
    let zeroButton = UIButton()
    let decimalButton = UIButton()
    let equalsButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        loadCalculator()
    }
    
    private func loadCalculator() {
        
        //Зона для расчетов
        let calculationView = UIView()
        calculationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(calculationView)
        
        NSLayoutConstraint.activate([
            calculationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            calculationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            calculationView.heightAnchor.constraint(equalToConstant: 320),
            calculationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
        
        calcLabel.text = "444"
        calcLabel.textColor = .white
        calcLabel.font = .systemFont(ofSize: 82, weight: .regular)
        calcLabel.textAlignment = .right
        calcLabel.translatesAutoresizingMaskIntoConstraints = false
        calculationView.addSubview(calcLabel)
        
        NSLayoutConstraint.activate([
            calcLabel.trailingAnchor.constraint(equalTo: calculationView.trailingAnchor, constant: -16),
            calcLabel.bottomAnchor.constraint(equalTo: calculationView.bottomAnchor)
        ])
        
        smallLabel.text = "222+222"
        smallLabel.textColor = .lightGray
        smallLabel.font = .systemFont(ofSize: 32, weight: .regular)
        smallLabel.textAlignment = .right
        smallLabel.translatesAutoresizingMaskIntoConstraints = false
        calculationView.addSubview(smallLabel)
        
        NSLayoutConstraint.activate([
            smallLabel.trailingAnchor.constraint(equalTo: calculationView.trailingAnchor, constant: -16),
            smallLabel.bottomAnchor.constraint(equalTo: calcLabel.topAnchor, constant: -10)
        ])
        
        //Контейнер для всех кнопок
        let buttonsContainer = UIView()
        buttonsContainer.translatesAutoresizingMaskIntoConstraints = false
        buttonsContainer.backgroundColor = .black
        view.addSubview(buttonsContainer)
        
        NSLayoutConstraint.activate([
            buttonsContainer.topAnchor.constraint(equalTo: calculationView.bottomAnchor),
            buttonsContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buttonsContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            buttonsContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant:  -10)
        ])
        
        //Основной вертикальный стэк для 5-ти горизонтальных
        let buttonsView = UIStackView()
        buttonsView.axis = .vertical
        buttonsView.spacing = 7
        buttonsView.distribution = .fillEqually
        buttonsView.translatesAutoresizingMaskIntoConstraints = false
        buttonsContainer.addSubview(buttonsView)
        
        NSLayoutConstraint.activate([
            buttonsView.leadingAnchor.constraint(equalTo: buttonsContainer.leadingAnchor, constant: 16),
            buttonsView.trailingAnchor.constraint(equalTo: buttonsContainer.trailingAnchor, constant: -16),
            buttonsView.topAnchor.constraint(equalTo: buttonsContainer.topAnchor, constant: 12),
            buttonsView.bottomAnchor.constraint(equalTo: buttonsContainer.bottomAnchor, constant: -16)
        ])
        
        let firstButtonStack = UIStackView()
        firstButtonStack.axis = .horizontal
        firstButtonStack.spacing = 10
        firstButtonStack.distribution = .fillEqually
        
        configureButton(acButton, title: "AC", color: .lightGray)
        configureButton(plusMinusButton, title: "+/-", color: .lightGray)
        configureButton(percentButton, title: "%", color: .lightGray)
        configureButton(divideButton, title: "/", color: .orange)
        
        firstButtonStack.addArrangedSubview(acButton)
        firstButtonStack.addArrangedSubview(plusMinusButton)
        firstButtonStack.addArrangedSubview(percentButton)
        firstButtonStack.addArrangedSubview(divideButton)
        
        buttonsView.addArrangedSubview(firstButtonStack)
        
        let secondButtonStack = UIStackView()
        secondButtonStack.axis = .horizontal
        secondButtonStack.spacing = 10
        secondButtonStack.distribution = .fillEqually
        
        configureButton(sevenButton, title: "7", color: .darkGray)
        configureButton(eightButton, title: "8", color: .darkGray)
        configureButton(nineButton, title: "9", color: .darkGray)
        configureButton(multiplyButton, title: "×", color: .orange)
        
        secondButtonStack.addArrangedSubview(sevenButton)
        secondButtonStack.addArrangedSubview(eightButton)
        secondButtonStack.addArrangedSubview(nineButton)
        secondButtonStack.addArrangedSubview(multiplyButton)
        
        buttonsView.addArrangedSubview(secondButtonStack)
        
        let thirdButtonStack = UIStackView()
        thirdButtonStack.axis = .horizontal
        thirdButtonStack.spacing = 10
        thirdButtonStack.distribution = .fillEqually
        
        configureButton(fourButton, title: "4", color: .darkGray)
        configureButton(fiveButton, title: "5", color: .darkGray)
        configureButton(sixButton, title: "6", color: .darkGray)
        configureButton(minusButton, title: "-", color: .orange)
        
        thirdButtonStack.addArrangedSubview(fourButton)
        thirdButtonStack.addArrangedSubview(fiveButton)
        thirdButtonStack.addArrangedSubview(sixButton)
        thirdButtonStack.addArrangedSubview(minusButton)
        
        buttonsView.addArrangedSubview(thirdButtonStack)
        
        let fourthButtonStack = UIStackView()
        fourthButtonStack.axis = .horizontal
        fourthButtonStack.spacing = 10
        fourthButtonStack.distribution = .fillEqually
        
        configureButton(oneButton, title: "1", color: .darkGray)
        configureButton(twoButton, title: "2", color: .darkGray)
        configureButton(threeButton, title: "3", color: .darkGray)
        configureButton(plusButton, title: "+", color: .orange)
        
        fourthButtonStack.addArrangedSubview(oneButton)
        fourthButtonStack.addArrangedSubview(twoButton)
        fourthButtonStack.addArrangedSubview(threeButton)
        fourthButtonStack.addArrangedSubview(plusButton)
        
        buttonsView.addArrangedSubview(fourthButtonStack)
        
        let fifthButtonStack = UIStackView()
        fifthButtonStack.axis = .horizontal
        fifthButtonStack.spacing = 10
        fifthButtonStack.distribution = .fillEqually
        
        configureButton(calcButton, title: "📱", color: .darkGray)
        configureButton(zeroButton, title: "0", color: .darkGray)
        configureButton(decimalButton, title: ",", color: .darkGray)
        configureButton(equalsButton, title: "=", color: .orange)
        
        fifthButtonStack.addArrangedSubview(calcButton)
        fifthButtonStack.addArrangedSubview(zeroButton)
        fifthButtonStack.addArrangedSubview(decimalButton)
        fifthButtonStack.addArrangedSubview(equalsButton)
        
        buttonsView.addArrangedSubview(fifthButtonStack)
        
        func configureButton(_ button: UIButton, title: String, color: UIColor) {
            button.setTitle(title, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 32, weight: .medium)
            button.backgroundColor = color
            button.setTitleColor(.white, for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            let buttonSize: CGFloat = 90
            button.widthAnchor.constraint(equalToConstant: buttonSize).isActive = true
            button.heightAnchor.constraint(equalToConstant: buttonSize).isActive = true
            button.layer.cornerRadius = buttonSize / 2
            button.clipsToBounds = true
        }
    }
}

