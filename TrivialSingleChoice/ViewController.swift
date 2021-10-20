//
//  ViewController.swift
//  TrivialSingleChoice
//
//  Created by عبدالعزيز البلوي on 12/03/1443 AH.
//

import UIKit

class ViewController: UIViewController {
  
  
  @IBOutlet weak var qustionNumberLabel: UILabel!
  @IBOutlet weak var qustionTextView: UITextView!
  @IBOutlet weak var scoreLable: UILabel!
  @IBOutlet weak var progressView: UIProgressView!
  @IBOutlet weak var opstionA: UIButton!
  @IBOutlet weak var optionB: UIButton!
  
  
  var score : Int = 0
  var qustionNumber : Int = 0
  var selectedAnswer : Int = 0
  var allQuesttion = questionBank()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    updateQuestion()
    updateInterface()
    // Do any additional setup after loading the view.
  }
  
  @IBAction func Answer_button(_ sender: UIButton) {
    if sender.tag == selectedAnswer{
      print("Correct")
      if selectedAnswer == 1{
        opstionA.backgroundColor = .green
      }else{
        optionB.backgroundColor = .green
      }
      score += 1
    }else{
      if selectedAnswer == 1{
        optionB.backgroundColor = .red
      }else{ opstionA.backgroundColor = .red
      }
      
      
      print("Incorrect")
      
    }
    qustionNumber += 1
    nextt()
  }
  
  func updateQuestion() {
    if qustionNumber <= allQuesttion.list.count - 1{
      qustionTextView.text = allQuesttion.list[qustionNumber].Question
      selectedAnswer = allQuesttion.list[qustionNumber].correctAnswer
      opstionA.setTitle(allQuesttion.list[qustionNumber].optionA, for:.normal)
      optionB.setTitle(allQuesttion.list[qustionNumber].optionB, for: .normal)
      updateInterface()
      
      
    }else{
      let alert = UIAlertController(title: "alert", message: "do you want to start over?", preferredStyle: .alert)
      let restartaction = UIAlertAction(title: "alert", style: .default, handler: {action in self.restart()})
      alert.addAction(restartaction)
      present(alert, animated: true, completion: nil)
    }
  }
  
  func updateInterface() {
    scoreLable.text = "\(score)"
    qustionNumberLabel.text = "\(qustionNumber + 1)/\(allQuesttion.list.count)"
    progressView.progress = Float(Float(qustionNumber + 1)/Float(allQuesttion.list.count))
    opstionA.backgroundColor = .systemIndigo
    optionB.backgroundColor = .black
  }
  
  
  func restart(){
    score = 0
    qustionNumber = 0
    updateQuestion()
  }
  func nextt() {
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
      self.updateQuestion()
    })
  }
  
  
}
