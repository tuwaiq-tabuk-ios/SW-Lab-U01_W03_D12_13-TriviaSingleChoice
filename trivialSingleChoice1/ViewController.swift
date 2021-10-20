
import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var questionLabel: UILabel!
  @IBOutlet weak var trueButton: UIButton!
  @IBOutlet weak var falseButton: UIButton!
  @IBOutlet weak var progressView: UIProgressView!
  
  
  var currentProgress  = 0
  var quiz : Quiz = Quiz()
  var score = 0
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureButtons()
    progressView.progress = 0
    
    scoreLabel.text = "Score : \(score)"
    updateUI()
    
  }
  
  
  @IBAction func answerPressed(_ sender: UIButton) {
    let selectedValue = sender.currentTitle!
    let isCorrect = quiz.getAnswer(selectedValue)
    
    if isCorrect {
      sender.backgroundColor = UIColor.green
    }else{
      sender.backgroundColor = UIColor.red
    }
    
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute:{
      sender.backgroundColor = UIColor.gray
    })
    quiz.getNextQuestion()
    
    if quiz.questionNumber == quiz.questions.count {
      showMessage()
    }
    updateUI()
    
  }
  
  
  func updateUI(){
    progressView.progress = quiz.getProgress()
    if quiz.questionNumber < quiz.questions.count {
      questionLabel.text = quiz.getQuestion()
    }
    
    scoreLabel.text = "Score : \(quiz.getScore())"
    
  }
  
  
  func configureButtons() {
    trueButton.backgroundColor = .gray
    trueButton.layer.cornerRadius = 10
    trueButton.layer.borderWidth = 1
    trueButton.layer.borderColor = UIColor.black.cgColor
    
    falseButton.backgroundColor = .gray
    falseButton.layer.cornerRadius = 10
    falseButton.layer.borderWidth = 1
    falseButton.layer.borderColor = UIColor.black.cgColor
  }
  
  
  func showMessage() {
    let alert = UIAlertController(title: "Game Over", message: "", preferredStyle: UIAlertController.Style.alert)
    
    alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: { _ in
      //Cancel Action
    }))
    
    
    self.present(alert, animated: true, completion: nil)
  }
}
