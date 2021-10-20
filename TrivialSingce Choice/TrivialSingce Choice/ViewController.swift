//
//  ViewController.swift
//  TrivialSingce Choice
//
//  Created by Yousef Albalawi on 12/03/1443 AH.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var scorelebul: UILabel!
  @IBOutlet weak var questionNamber: UILabel!
  @IBOutlet weak var progressView: UIProgressView!
  @IBOutlet weak var opbionA: UIButton!
  @IBOutlet weak var opbionB: UIButton!
  @IBOutlet weak var textLebul: UITextView!
  
  
  var score:Int = 0
  var questionNamber1:Int = 0
  var selectedAnswer:Int = 0
  var allquestion = QustionBanke ()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    updetquestion()
    updateIntrface()
    
    // Do any additional setup after loading the view.
  }
  
  
  
  @IBAction func answerButton(_ sender: UIButton) {
    if sender.tag == selectedAnswer {
      print("Correct")
      if selectedAnswer == 1{
        opbionA.backgroundColor = .green
      }else{
        opbionB.backgroundColor = .green
      }
      score += 1
    }else{
      if selectedAnswer == 1{
        opbionB.backgroundColor = .red
      }else{
        opbionA.backgroundColor = .red
      }
      print("Incorrect")
     
    }
    questionNamber1 += 1
   
    nextt()
 
  
  }
  func updetquestion (){
    if questionNamber1 <= allquestion.list.count - 1{
      textLebul.text = allquestion.list[questionNamber1].qustion
      selectedAnswer = allquestion.list[questionNamber1].correctAnswer
      opbionA.setTitle(allquestion.list[questionNamber1].optionA, for: .normal)
      opbionB.setTitle(allquestion.list[questionNamber1].optionB, for: .normal)
      updateIntrface()
      
    }else{
      let alert = UIAlertController(title: "String", message: "do you want to start over?", preferredStyle: .alert)
      let restartAction = UIAlertAction(title: "Yes", style: .default, handler: {action in self.restart()})
      alert.addAction(restartAction)
      present(alert, animated: true, completion: nil)
    }
 }
  
  
  func updateIntrface(){
    scorelebul.text = "\(score)"
    questionNamber.text = "\(questionNamber1 + 1)/\(allquestion.list.count)"
    progressView .progress =  Float(Float(questionNamber1 + 1)/Float(allquestion.list.count))
    opbionA.backgroundColor = .black
    opbionB.backgroundColor = .black
  }
  
  
  func restart (){
    score = 0
    questionNamber1 = 0
    updetquestion()
  }
  
  
  func nextt()  {
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute:{ self.updetquestion()
  })
}

}

