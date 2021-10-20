//
//  ViewController.swift
//  TrivialSingleChoise
//
//  Created by rasha  on 13/03/1443 AH.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var ScoreLabel: UILabel!
  @IBOutlet weak var questionLabel: UILabel!
  @IBOutlet weak var progressView: UIProgressView!
  @IBOutlet weak var trueButton: UIButton!
  @IBOutlet weak var falseButton: UIButton!
  
  var triviaBrain = TriviaBrain()
  
  var score:Int = 0
  var questionNumber = 0
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureButtons()
    updateUI()
    if triviaBrain.questionNumber == 0{
      ShowGameOver()
      
    }
  }
  
  
  @IBAction func answerButtonPressed(_ sender: UIButton) {
    let userAnswer = sender.currentTitle!
    
    let userGotItRight = triviaBrain.checkAnswer(userAnswer: userAnswer)
    
    if userGotItRight {
      sender.backgroundColor = UIColor.green
    } else {
      sender.backgroundColor = UIColor.red
    }
    
    triviaBrain.nextQuestion()
    
    Timer.scheduledTimer(timeInterval: 0.2,
                         target: self,
                         selector: #selector(updateUI),
                         userInfo: nil, repeats: false)
    
    if triviaBrain.questionNumber == 0 {
      ShowGameOver()
    }
  }
  
  @objc func updateUI() {
    questionLabel.text = triviaBrain.getQuestionText()
    progressView.progress = triviaBrain.getProgress()
    ScoreLabel.text = "Score: \(triviaBrain.getScore())"
    trueButton.backgroundColor = UIColor.clear
    falseButton.backgroundColor = UIColor.clear
  }
  
  
  func ShowGameOver() {
    let alert = UIAlertController(title:"endTheGame",message:"anything", preferredStyle: .alert)
    let reStartAction = UIAlertAction(title:"alert" ,style: .default) {_ in
      self.reStart() }
    alert.addAction(reStartAction)
    present(alert, animated: true, completion: nil)
  }
  
  func reStart() {
    score = 0
    questionNumber = 0
  }
  
  func configureButtons() {
    trueButton.layer.cornerRadius = 8
    trueButton.layer.borderWidth = 3
    trueButton.layer.borderColor = UIColor.black.cgColor
    falseButton.layer.cornerRadius = 8
    falseButton.layer.borderWidth = 3
    falseButton.layer.borderColor = UIColor.black.cgColor
  }
  
}







