
import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var questionLabel: UILabel!
  @IBOutlet weak var answerTrue: UIButton!
  @IBOutlet weak var answerFalse: UIButton!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var progressView: UIProgressView!
  
  var triviaBrain = TriviaBrain()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    updateUI()
    configureButtons()
    scoreLabel.text = "score: \(triviaBrain.())"
  
  }
  
  
  
  @IBAction func answerPressed(_ sender: UIButton) {
     let userAnswer = sender.currentTitle!
    
    let isRightAnswer = triviaBrain.isAnswerCorrect(userAnswer)
    if isRightAnswer {
      sender.backgroundColor = .systemGreen
    } else {
      sender.backgroundColor = .systemRed
    }
    
    if triviaBrain.nextQuestion(){
      Timer.scheduledTimer(timeInterval:0.5,
                           target: self,
                           selector: #selector(updateUI),
                           userInfo: nil,
                           repeats: false)
      
    }else{
      showGameOverAlertMessage()
    }
  }
  
  
  @objc func updateUI(){
    
    questionLabel.text = triviaBrain.checkQuestion()
    progressView.progress = triviaBrain.checkProgress()
    scoreLabel.text = "Score: \(triviaBrain.())"
    answerFalse.backgroundColor = UIColor.clear
    answerTrue.backgroundColor = UIColor.clear
  }
  
  
  func showGameOverAlertMessage(){
    
    let ac = UIAlertController(
      title:"Game Over", message:"Your score is \(triviaBrain.())",
      preferredStyle: .alert)
    ac.addAction(UIAlertAction(title: "Play again", style: .default, handler:startGameAgain))
    present(ac,animated:true)
  }
  
  
  func configureButtons() {
    answerTrue.layer.cornerRadius = 20
    answerTrue.layer.masksToBounds = true
    answerFalse.layer.cornerRadius = 20
    answerFalse.layer.masksToBounds = true
  }
  
  
  func startGameAgain(action:UIAlertAction! = nil){
    triviaBrain.startGame()
    updateUI()
  }
  
}
