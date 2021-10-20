//
//  ViewController.swift
//  TrivialSingleChoice
//
//  Created by Ressam Al-Thebailah on 12/03/1443 AH.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var questionLabel: UILabel!
  @IBOutlet weak var answerTrue: UIButton!
  @IBOutlet weak var answerFalse: UIButton!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var ProgressView: UIProgressView!
  
  var triviaBrain = TriviaBrain()
  //var change = 1
  override func viewDidLoad() {
    super.viewDidLoad()
    updateUI()
    configureButtons()
    scoreLabel.text = "score: \(triviaBrain.getScore())"
    //ProgressView.progress = 0.0
  }
  
  
  
  @IBAction func answerPressed(_ sender: UIButton) {
    guard let userAnswer = sender.currentTitle else {
      print("ERROR: Button do not have the title property set in storyboard")
      return
    }
    
    let isRightAnswer = triviaBrain.isAnswerCorrect(userAnswer)
    if isRightAnswer {
      sender.backgroundColor = .systemGreen
    } else {
      sender.backgroundColor = .systemRed
    }
  
    if triviaBrain.nextQuestion(){
      Timer.scheduledTimer(timeInterval:2.0, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }else{
      showGameOverAlertMessage()
    }
    }
  
  
  
  @objc func updateUI(){
    questionLabel.text = triviaBrain.getQuestion()
    ProgressView.progress = triviaBrain.getProgress()
    scoreLabel.text = "Score: \(triviaBrain.getScore())"
    
    
    answerFalse.backgroundColor = UIColor.clear
    answerTrue.backgroundColor = UIColor.clear
  }
  
  
  
  func showGameOverAlertMessage(){
    let ac = UIAlertController(
      title:"Game Over", message:"Your score is \(triviaBrain.getScore())",
      preferredStyle: .alert)
    ac.addAction(UIAlertAction(title: "play again", style: .default, handler:startGameAgain))
    present(ac,animated:true)
  }
  
  
  func configureButtons() {
    answerTrue.layer.cornerRadius = 15
    answerTrue.layer.masksToBounds = true
    answerFalse.layer.cornerRadius = 15
    answerFalse.layer.masksToBounds = true
  }
  func startGameAgain(action:UIAlertAction! = nil){
    triviaBrain.startGame()
    updateUI()
  }
  
}
