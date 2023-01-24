//
//  ViewController.swift
//  EggTimer_programmatically
//
//  Created by Vitali Martsinovich on 2023-01-24.
//

import UIKit

class ViewController: UIViewController {
    
    var questionLabel: UILabel = {
        
        let label = UILabel()
        label.text = "How do you like your eggs?"
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
//    var globalStackView: UIStackView = {
//        let stack2 = UIStackView()
//        stack2.axis = .vertical
//        stack2.alignment = .fill
//        stack2.distribution = .fillEqually
//        stack2.spacing = 39
//        stack2.translatesAutoresizingMaskIntoConstraints = false
//        return stack2
//        
//    }()
    
    var eggsStackView: UIStackView = {
        
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 20
        stack.heightAnchor.constraint(equalToConstant: 250).isActive = true
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
        
    }()
    
    var softEgg: UIButton = {
        let soft = UIButton()
        soft.setBackgroundImage(UIImage(named: "soft_egg"), for: .normal)
        soft.setTitle("Soft", for: .normal)
        soft.setTitleColor(.black, for: .normal)
        soft.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        soft.titleLabel?.textAlignment = .center
        soft.translatesAutoresizingMaskIntoConstraints = false
        return soft
    }()
    
    var mediumEgg: UIButton = {
       let medium = UIButton()
        medium.setBackgroundImage(UIImage(named: "medium_egg"), for: .normal)
        medium.setTitle("Medium", for: .normal)
        medium.setTitleColor(.black, for: .normal)
        medium.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        medium.titleLabel?.textAlignment = .center
        medium.translatesAutoresizingMaskIntoConstraints = false
        return medium
    }()
    
    var hardEgg: UIButton = {
       let hard = UIButton()
        hard.setBackgroundImage(UIImage(named: "hard_egg"), for: .normal)
        hard.setTitle("Hard", for: .normal)
        hard.setTitleColor(.black, for: .normal)
        hard.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        hard.titleLabel?.textAlignment = .center
        hard.translatesAutoresizingMaskIntoConstraints = false
        return hard
    }()
    
    var eggsProgress: UIProgressView = {
        
        let progress = UIProgressView(progressViewStyle: .bar)
        progress.progressTintColor = .systemYellow
        progress.trackTintColor = .systemGray
        progress.translatesAutoresizingMaskIntoConstraints = false
        
        return progress
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 203.0 / 255.0, green: 242.0 / 255.0, blue: 252.0 / 255.0, alpha: 1.0)
        
        addEggsToStack()
        addSubviews()
        setConstraints()
        
    }
    
    func addSubviews() {
        
        view.addSubview(questionLabel)
        view.addSubview(eggsStackView)
        view.addSubview(eggsProgress)
    }
    
    func addEggsToStack() {
        
        eggsStackView.addArrangedSubview(softEgg)
        eggsStackView.addArrangedSubview(mediumEgg)
        eggsStackView.addArrangedSubview(hardEgg)

    }

    func setConstraints() {
        
        NSLayoutConstraint.activate([
        
            questionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            questionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            questionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            eggsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            eggsStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            eggsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            eggsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            eggsProgress.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            eggsProgress.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    
        ])
    }
    
    

}

