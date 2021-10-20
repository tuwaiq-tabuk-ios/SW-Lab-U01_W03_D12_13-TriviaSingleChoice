//
//  ViewController.swift
//  TrivialSingleChoise
//
//  Created by ahlam  on 12/03/1443 AH.
//


import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var qusetionLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    var question = Question2()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        trueButton.layer.cornerRadius = 10
        trueButton.layer.borderWidth = 3
        trueButton.layer.borderColor = UIColor.black.cgColor
        falseButton.layer.cornerRadius = 10
        falseButton.layer.borderWidth = 3
        falseButton.layer.borderColor = UIColor.black.cgColor
        
    }
    
    
    @IBAction func answerButtonPresswd(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        
        let userGotItRight = question.checkAnswer(userAnswer: userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        question.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    
    @objc func updateUI() {
        qusetionLabel.text = question.getQuestionText()
        progressView.progress = question.getProgress()
        scoreLabel.text = "Score: \(question.getScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
}


