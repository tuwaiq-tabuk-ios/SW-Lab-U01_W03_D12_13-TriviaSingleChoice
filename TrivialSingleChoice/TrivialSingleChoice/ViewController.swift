//
//  ViewController.swift
//  TrivialSingleChoice
//
//  Created by Ahmed awadh alqhtani on 12/03/1443 AH.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var scoreLaple: UILabel!
  @IBOutlet var questionNumberLapel: UILabel!
  @IBOutlet weak var questionLapel: UILabel!
  @IBOutlet weak var progress: UIProgressView!
  @IBOutlet weak var optionA: UIButton!
  
  @IBOutlet weak var optionB: UIButton!
  
  
  var allQuestion = QuestionBank()
  var score:Int = 0
  var questionNumber:Int = 0
  var seletedAnswer:Int = 0
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    updateQuestion()
    updateInterFace()
  }
  
  @IBAction func answerButton(_ sender: UIButton) {
    
    if sender.tag == seletedAnswer {
      
      print("correct")
      score += 1
      if seletedAnswer == 1{
        optionA.tintColor = .green
      } else {
        optionB.tintColor = .green
      }
    } else {
      print("Incorrect")
      if seletedAnswer == 1 {
        optionB.tintColor = .red
      } else {
        optionA.tintColor = .red
      }
      
    }
    
    questionNumber += 1
    next()
    
  }
  
  func next() {
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
      self.updateQuestion()
    }
  }
  //هذا فانكشون الي يقلب الاسالة
  func updateQuestion()   {
    if questionNumber <= allQuestion.questions.count - 1 {
      questionLapel.text = allQuestion.questions[questionNumber].question
      seletedAnswer = allQuestion.questions[questionNumber].correctAnser
      optionA.setTitle(allQuestion.questions[questionNumber].optionA, for: .normal)
      optionB.setTitle(allQuestion.questions[questionNumber].optionB, for: .normal)
      updateInterFace()
    } else {
      let alert = UIAlertController(title: "alert", message: "Do you want to start over ?", preferredStyle: .alert)
      let reStartAction = UIAlertAction(title: "Yes", style: .default, handler: {action in self.reStart()})
      alert.addAction(reStartAction)
      present(alert, animated: true, completion: nil)
      
      
      
    }
  }
  
  //عدد الاسالة
  func updateInterFace()  {
    scoreLaple.text = "Score \(score)"
    questionNumberLapel.text = "\(questionNumber + 1)/\(allQuestion.questions.count)"
    
    progress.progress = Float(Float(questionNumber + 1) / Float(allQuestion.questions.count))
    optionA.tintColor = .white
    optionB.tintColor = .white
    
    
    
  }
  
  
  
  func reStart(){
    score = 0
    questionNumber = 0
    updateQuestion()
  }
  
  
  
}
