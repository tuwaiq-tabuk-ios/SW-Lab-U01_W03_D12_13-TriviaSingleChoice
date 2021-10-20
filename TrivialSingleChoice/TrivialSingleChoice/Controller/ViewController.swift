//
//  ViewController.swift
//  Quiz
//
//
import UIKit

class ViewController: UIViewController {
  


  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var QuestionText: UILabel!
  @IBOutlet weak var TrueBottom: UIButton!
  @IBOutlet weak var FalseBottom: UIButton!
  
  @IBOutlet weak var Progress: UIProgressView!
  
  var questionNumber:Int = 0
  var quizManager = QuizManager()
  var score = 1
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    TrueBottom.layer.cornerRadius = 20
    TrueBottom.layer.masksToBounds = true
    
    FalseBottom.layer.cornerRadius = 20
    FalseBottom.layer.masksToBounds = true
    
    updateUI()
    Progress.progress = 0.0
    
    // Do any additional setup after loading the view.
    
  }
  
  
  @IBAction func answerSelected(_ sender: UIButton) {
    let userAnswer = sender.currentTitle!
    let check = quizManager.checkAnswer(userAnswer)
    if check{
      sender.backgroundColor = UIColor.green
    }
    else {
      sender.backgroundColor = UIColor.red
    }
    
    Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    
    if quizManager.nextQuestion() {
      
    }
    else {
      showAlertView()
    }
    
  }
  
  
  @objc func updateUI(){
    QuestionText.text = quizManager.checkQuestion()
    Progress.progress = quizManager.checkProgress()
    scoreLabel.text = "Score: \(quizManager.checkScore())"
    
    
    TrueBottom.backgroundColor = UIColor.clear
    FalseBottom.backgroundColor = UIColor.clear
    
    
    TrueBottom.setTitle(quizManager.checkChoices()[0], for: .normal)
    FalseBottom.setTitle(quizManager.checkChoices()[1], for: .normal)
  }
  
  
  func showAlertView() {
    let alert = UIAlertController(title: "End game", message: "play agine?", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Yes", style: .cancel, handler: {action in
      print("Yes clicked")
    }))
    alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
    present(alert, animated: true, completion: nil)
  }
}
