//
//  ViewController.swift
//  TrivialSingleChoise
//
//  Created by hajer . on 12/03/1443 AH.
//

import UIKit

class ViewController: UIViewController {
  
  
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var questionLabel: UILabel!
  @IBOutlet weak var progressView: UIProgressView!
  
  @IBOutlet weak var trueButton: UIButton!
  @IBOutlet weak var falseButton: UIButton!
  
  var trivaBrain = TriviaBrain()
  var question = TriviaBrain()
  var score : Int = 0
  var questionNumber = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureButtons()
    
    updateUI()
  }
  
  
  @IBAction func answerButtonPressed(_ sender: UIButton) {
    let userAnswer = sender.currentTitle!
    
    let userGotItRight = question.checkAnswer(userAnswer: userAnswer)
    print("userGotItRight: \(userGotItRight)")
    
    if userGotItRight {
      sender.backgroundColor = UIColor.green
    } else {
      sender.backgroundColor = UIColor.red
    }
    
    question.nextQuestion()
    
    Timer.scheduledTimer(timeInterval: 0.8,
                         target: self,
                         selector: #selector(updateUI),
                         userInfo: nil,
                         repeats: false)
    
    if question.questionNumber == 0 {
      ShowGameOver()    }
    
    
  }
  
  
  
  @objc func updateUI() {
    scoreLabel.text = "Score: \(question.getScore())"
    questionLabel.text = question.getQuestionText()
    progressView.progress = question.getProgress()
    trueButton.backgroundColor = UIColor.clear
    falseButton.backgroundColor = UIColor.clear
  }
  
  
  func configureButtons() {
    trueButton.layer.cornerRadius = 8
    trueButton.layer.borderWidth = 3
    trueButton.layer.borderColor = UIColor.black.cgColor
    
    falseButton.layer.cornerRadius = 8
    falseButton.layer.borderWidth = 3
    falseButton.layer.borderColor = UIColor.black.cgColor
  }
  func ShowGameOver() {
      let alert = UIAlertController(title:"alert",message:"gameover", preferredStyle: .alert)
      let reStartAction = UIAlertAction(title:"alert" ,style: .default) {_ in
        self.reStart() }
      alert.addAction(reStartAction)
      present(alert, animated: true, completion: nil)
    }
    
    func reStart() {
      score = 0
      questionNumber = 0
        question.score = 0
        scoreLabel.text = "Score: \(question.getScore())"
    }
    
  
    }
    
  
  
  

