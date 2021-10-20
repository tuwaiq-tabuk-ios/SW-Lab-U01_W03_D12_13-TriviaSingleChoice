//
//  ViewController.swift
//  TrivialSingleChoice
//
//  Created by A A on 12/03/1443 AH.
//

import UIKit
import Foundation


struct QuizQuestion {
  
  var question:String
  var answer:Bool
  
}


class ViewController: UIViewController {
  
  
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var questhionLabel: UILabel!
  
  
  private let questions = [
    QuizQuestion(
      question: "Can classes inherit from antoer class?",
      answer: true),
    QuizQuestion(
      question: "Can structs inherit from antoer struct?",
      answer: false) ,
    QuizQuestion(
      question: "Are classes default initialized ?",
      answer :false),
    QuizQuestion(
      question: "Are structs value type ?",
      answer: true) ]
  
  
  private var currentQuestionIndex = 0
  private var score = 0
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    self.questhionLabel.text = questions[currentQuestionIndex].question
    progressView.progress = 0
    configureButtons()
  }
  
  
  @IBOutlet weak var trueButton: UIButton!
  @IBOutlet weak var falseButton: UIButton!
  
  @IBOutlet weak var progressView: UIProgressView!
  
  
  
  @IBAction func answerPressed(_ sender: UIButton) {
    
    if currentQuestionIndex >= questions.count { return }
    
    
    let userAnswer = sender.currentTitle
    let isAnswerCorrect = userAnswer?.toBool() == questions[currentQuestionIndex].answer
    
    
    if isAnswerCorrect {
      score += 1
      scoreLabel.text = "\(score)"
      sender.backgroundColor = .systemGreen
      
    } else {
      score -= 1
      scoreLabel.text = "\(score)"
      sender.backgroundColor = .systemRed
    }
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5,
                                  execute: {
                                    sender.backgroundColor = UIColor.clear
                                  })
    
    currentQuestionIndex += 1
    progressView.progress += 0.25
    
    let isThereAnyQuestionsLeft = currentQuestionIndex < questions.count
    if isThereAnyQuestionsLeft {
      questhionLabel.text = questions[currentQuestionIndex].question
    } else {
      showGameOverAlertMessage() }
    
  }
  
  
  func showGameOverAlertMessage(){
    let alarm = UIAlertController(title: "GAME OVER", message: "Your score is \(score)", preferredStyle: .alert)
    
    alarm.addAction(UIAlertAction(title: "Done", style: .default))
    
    present(alarm, animated: true)
    
  }
  
  
  func configureButtons(){
    
    trueButton.layer.cornerRadius = 30
    trueButton.layer.borderWidth = 3
    trueButton.layer.borderColor = UIColor.white.cgColor
    
    falseButton.layer.cornerRadius = 30
    falseButton.layer.borderWidth = 3
    falseButton.layer.borderColor = UIColor.white.cgColor
    
  }
  
}


extension String {
  func toBool() -> Bool? {
    switch self {
    case "True", "true", "yes", "1":
      return true
    case "False", "false", "no", "0":
      return false
    default:
      return nil
    }
  }
}








