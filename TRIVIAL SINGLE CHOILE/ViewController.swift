//
//  ViewController.swift
//  TRIVIAL SINGLE CHOILE
//
//  Created by روابي باجعفر on 12/03/1443 AH.
//

import UIKit

class ViewController: UIViewController {

  var quizManager = QuizManager()
var change = 0
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  
    updateUI()
    
    // True Button
    
    trueButton.layer.cornerRadius = 15
    trueButton.layer.masksToBounds = true
  
    // False Botton
    falseButton.layer.cornerRadius = 15
    falseButton.layer.masksToBounds = true
  }
  
  @IBOutlet weak var Score: UILabel!
  @IBOutlet weak var questionText: UILabel!
  @IBOutlet weak var trueButton: UIButton!
  @IBOutlet weak var falseButton: UIButton!
  @IBOutlet weak var progressBar: UIProgressView!
  
  @IBAction func answerSelectes(_ sender: UIButton) {
 
  let userAnswer = sender.currentTitle!
      let check = quizManager.checkAnswer(userAnswer)
        
      if check{
            sender.backgroundColor = UIColor.green;
        }
        else {
            sender.backgroundColor = UIColor.red;
        }
    if quizManager.nextQuestion() {
      
    }
    else {
      showGameOverAlertMessage()
    
    }

    Timer.scheduledTimer(timeInterval: 1.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    
  }
    @objc func updateUI(){
                
      questionText.text = quizManager.getQuestion()
      progressBar.progress = quizManager.checkProgress()
        Score.text = "Score: \(quizManager.checkScore())"
        
      trueButton.backgroundColor = UIColor.clear
      falseButton.backgroundColor = UIColor.clear
        
      trueButton.setTitle(quizManager.checkChoices()[0], for: .normal)
      falseButton.setTitle(quizManager.checkChoices()[1], for: .normal)
        
    }
  
  
  
  func showGameOverAlertMessage(){

   
 
    
    let ac = UIAlertController(title: "GAME OVER", message: "Your scores is", preferredStyle: .alert )
   
      
    ac.addAction(UIAlertAction(title: "Yes", style: .cancel, handler: {action in
        print("Yes clicked")
      }))
      ac.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
      present(ac, animated: true, completion: nil)
    }

}
  
  
  


