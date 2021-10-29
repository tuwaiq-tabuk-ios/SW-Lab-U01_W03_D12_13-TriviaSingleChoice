

import UIKit
import AVFoundation

class ViewController: UIViewController {
  
  //Labels:
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var questionLabel: UILabel!
  @IBOutlet weak var countScoreLabel: UILabel!
  
  //Buttons:
  @IBOutlet weak var trueButton: UIButton!
  @IBOutlet weak var falseButton: UIButton!
  
  //Progress Bar:
  @IBOutlet weak var progressView: UIProgressView!
  
  //Properties:
  var currentProgress  = 0
  var quiz : QuizBrain = QuizBrain()
  var score = 0
  var player: AVAudioPlayer?
  
  
  //function:
  override func viewDidLoad() {
    super.viewDidLoad()
    configureButtons()
    progressView.progress = 0
    scoreLabel.text = "Score: "
    countScoreLabel.text = " \(score) /70"
    updateScore()
  }
  
  
  //connect 2 (true/false) buttons so, they do the same action:
  @IBAction func answerPressed(_ sender: UIButton) {
    
    let userAnswer = sender.currentTitle!
    
    let isCorrect = quiz.getAnswer(userAnswer)
    
    if isCorrect {
      sender.backgroundColor = UIColor.green
      playTrueAnswerSound()
    } else{
      sender.backgroundColor = UIColor.red
      playWrongAnswerSound()
    }
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
      sender.backgroundColor = UIColor.clear
    })
    
    quiz.getNextQuestion()
    updateScore()
    
    // an if-statment to show end message at the end of the quiz:
    if quiz.questionNumber == quiz.questions.count {
      
      let alert = UIAlertController(title: "QUIZ IS DONE!", message: "You did a great job.", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "Quit the quiz", style: .default, handler: nil))
      self.present(alert, animated: true)
    }
  }
  
  
  //function that will update score after user choose an answer:
  func updateScore(){
    progressView.progress = quiz.getProgress()
    
    if quiz.questionNumber < quiz.questions.count {
      questionLabel.text = quiz.getQuestion()
    }
    
    countScoreLabel.text = " \(quiz.getScore()) / 70"
  }
  
  
  //function that will make buttons with rounded edges:
  func configureButtons() {
    trueButton.layer.cornerRadius = 10
    trueButton.layer.borderWidth = 1
    trueButton.layer.borderColor = UIColor.white.cgColor
    
    falseButton.layer.cornerRadius = 10
    falseButton.layer.borderWidth = 1
    falseButton.layer.borderColor = UIColor.white.cgColor
  }
  
  
  //function to play when user choose right answer:
  func playTrueAnswerSound() {
    guard let url = Bundle.main.url(forResource: "Right_Answer",
                                    withExtension: "mp3") else { return }
    do {
      try AVAudioSession.sharedInstance().setCategory(.playback,mode: .default)
      try AVAudioSession.sharedInstance().setActive(true)
      
      player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
      
      guard let player = player else { return }
      player.play()
      
    } catch let error {
      print(error.localizedDescription)
    }
  }
  
  
  //function to play when user choose wrong answer:
  func playWrongAnswerSound() {
    guard let url = Bundle.main.url(forResource: "Wrong_Answer",
                                    withExtension: "mp3") else { return }
    do {
      try AVAudioSession.sharedInstance().setCategory(.playback,mode: .default)
      try AVAudioSession.sharedInstance().setActive(true)
      
      player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
      
      guard let player = player else { return }
      player.play()
      
    } catch let error {
      print(error.localizedDescription)
    }
  }
}



