//
//  ViewController.swift
//  EggTimer_programmatically
//
//  Created by Vitali Martsinovich on 2023-01-24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    lazy var eggs = [softEgg, mediumEgg, hardEgg]
    let eggTimes = ["Soft": 300, "Medium":420, "Hard": 720]
    
    var player: AVAudioPlayer!
    
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    lazy var questionLabel: UILabel = {
        
        let label = UILabel()
        label.text = "How do you like your eggs?"
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    lazy var softEgg: UIButton = {
        let soft = UIButton(type: .system)
        soft.setBackgroundImage(UIImage(named: "soft_egg"), for: .normal)
        soft.setTitle("Soft", for: .normal)
        soft.setTitleColor(.black, for: .normal)
        soft.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        soft.titleLabel?.textAlignment = .center
        soft.imageView?.contentMode = .scaleAspectFit
        soft.translatesAutoresizingMaskIntoConstraints = false
        soft.addTarget(self, action: #selector(eggPressed), for: .touchUpInside)
        return soft
    }()
    
    lazy var mediumEgg: UIButton = {
        let medium = UIButton(type: .system)
        medium.setBackgroundImage(UIImage(named: "medium_egg"), for: .normal)
        medium.setTitle("Medium", for: .normal)
        medium.setTitleColor(.black, for: .normal)
        medium.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        medium.titleLabel?.textAlignment = .center
        medium.imageView?.contentMode = .scaleAspectFit
        medium.translatesAutoresizingMaskIntoConstraints = false
        medium.addTarget(self, action: #selector(eggPressed), for: .touchUpInside)
        return medium
    }()
    
    lazy var hardEgg: UIButton = {
        let hard = UIButton(type: .system)
        hard.setBackgroundImage(UIImage(named: "hard_egg"), for: .normal)
        hard.setTitle("Hard", for: .normal)
        hard.setTitleColor(.black, for: .normal)
        hard.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        hard.titleLabel?.textAlignment = .center
        hard.imageView?.contentMode = .scaleAspectFit
        hard.translatesAutoresizingMaskIntoConstraints = false
        hard.addTarget(self, action: #selector(eggPressed), for: .touchUpInside)
        return hard
    }()
    
    lazy var eggsProgressBar: UIProgressView = {
        
        let progress = UIProgressView(progressViewStyle: .bar)
        progress.progressTintColor = .systemYellow
        progress.trackTintColor = .systemGray
        progress.progress = 0.5
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.heightAnchor.constraint(equalToConstant: 5).isActive = true
        
        return progress
        
    }()
    
    lazy var eggStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: eggs)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 203.0 / 255.0, green: 242.0 / 255.0, blue: 252.0 / 255.0, alpha: 1.0)
        
        view.addSubview(questionLabel)
        view.addSubview(eggStack)
        view.addSubview(eggsProgressBar)
        
        setConstraints()
        
    }
    
    @objc func eggPressed(sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        totalTime = eggTimes[hardness]!
        
        eggsProgressBar.progress = 0.0
        
        questionLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
        
    }
    
    @objc func updateTimer() {
                
        if secondsPassed < totalTime {
            
            secondsPassed += 1
            eggsProgressBar.progress = Float(secondsPassed) / Float(totalTime)
            
        } else {
            
            timer.invalidate()
            questionLabel.text = "DONE!"
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
            
        }
            
        }
        
        func setConstraints() {
            
            NSLayoutConstraint.activate([
                
                questionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
                questionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                eggStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                eggStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                eggStack.heightAnchor.constraint(equalToConstant: 140),
                eggStack.widthAnchor.constraint(equalToConstant: 350),
                
                eggsProgressBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
                eggsProgressBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
                eggsProgressBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
                
            ])
        }
        
    }

