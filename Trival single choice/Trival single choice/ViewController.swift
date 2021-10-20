//
//  ViewController.swift
//  Trival single choice
//
//  Created by Ameera BA on 18/10/2021.
//

import UIKit

class ViewController: UIViewController {
  
  
  @IBOutlet weak var questionLabel: UILabel!
  @IBOutlet weak var countLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var progresView: UIProgressView!
  
  
  @IBOutlet weak var trueButton: UIButton!
  
  
  @IBOutlet weak var falseButton: UIButton!
  
  
  
  var allQuestions:QuestionBank = QuestionBank()
  // var selectedAnswer : String
  //  var qNumber = Int()
  // var score = 0
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
   
    
    trueButton.backgroundColor = .clear
    trueButton.layer.cornerRadius = 40
    trueButton.layer.borderWidth = 3
    
    falseButton.backgroundColor = .clear
    falseButton.layer.cornerRadius = 40
    falseButton.layer.borderWidth = 3
    
      updateQuestion()
    scoreLabel.text = "Score: \(allQuestions.getScore())"

    
  }
  
  
  @IBAction func resultButtonsPressed(_ sender: UIButton) {
    guard let userAnser = sender.currentTitle else {
      print("ERROR")
      return
    }
    
    let isRightAnswer = allQuestions.isAnswerCorrect(userAnswer: userAnser)
    
    if isRightAnswer {
      sender.backgroundColor = .systemGreen
    }else{
      sender.backgroundColor = .systemRed
      
    }
    if allQuestions.nextQuestion(){
    Timer.scheduledTimer(timeInterval: 1.2, target: self, selector: #selector(updateQuestion), userInfo: nil, repeats: false)
    }else{
      showGameOverMessage()
    }
    
    /*if  allQuestions.getChoices() == allQuestions.getQuestion(){
      Timer.scheduledTimer(timeInterval: 1.2, target: self, selector: #selector(updateQuestion), userInfo: nil, repeats: false)
    }else{
      showGameOverMessage()
    }*/
    
    
    
    func showGameOverMessage(){
      let ac = UIAlertController(
        title:"GAME OVER", message:"Your score is \(allQuestions.getScore())",
        preferredStyle: .alert
      )
      
      ac.addAction(UIAlertAction(title:"Play again",
                                 style:.default,
                                 handler:startGameAgain))
      
      present(ac, animated: true)
      
    }
    
  }
  @objc func updateQuestion() {
    
    if allQuestions.qustionNumber <= allQuestions.list.count{
      progresView.setProgress(Float(allQuestions.getProgress()), animated: true)
      questionLabel.text = allQuestions.getQuestion()
      scoreLabel.text = "Score: \(allQuestions.getScore())"
          trueButton.backgroundColor = UIColor.clear
          falseButton.backgroundColor = UIColor.clear
    }
  }
  func startGameAgain(action:UIAlertAction! = nil){
    allQuestions.startGame()
    updateQuestion()
  }
  
}



