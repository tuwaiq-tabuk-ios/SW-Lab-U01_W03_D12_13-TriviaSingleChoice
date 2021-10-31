import UIKit
 import Foundation
 import AVFoundation


 class ViewController: UIViewController {


   @IBOutlet weak var scoreLabel: UILabel!
   @IBOutlet weak var questionLabel: UILabel!

  var triviaBrain = TriviaBrain()
   var score : Int = 0
   var questionNumber = 0

   var player: AVAudioPlayer?
  
     override func viewDidLoad() {
     
     
     updateUI()
     configureButtons()

   }


   @IBOutlet weak var trueButton: UIButton!
   @IBOutlet weak var falseButton: UIButton!

   @IBOutlet weak var progressView: UIProgressView!



   @IBAction func answerPressed(_ sender: UIButton) {
     let userAnswer = sender.currentTitle!

     let userGotItRight = triviaBrain.checkAnswer(userAnswer: userAnswer)

     if userGotItRight {
       sender.backgroundColor = UIColor.green
     } else {
       sender.backgroundColor = UIColor.red
     }

     triviaBrain.nextQuestion()

     Timer.scheduledTimer(timeInterval: 0.3,
                          target: self,
                          selector: #selector(updateUI),
                          userInfo: nil, repeats: false)

     if triviaBrain.questionNumber == 0 {

       updateQuestion()
       playSound()
     }

   }


   @objc func updateUI() {
     questionLabel.text = triviaBrain.getQuestionText()
     progressView.progress = triviaBrain.getProgress()
     scoreLabel.text = "\(triviaBrain.getScore())"
     trueButton.backgroundColor = UIColor.clear
     falseButton.backgroundColor = UIColor.clear
   }


   func updateQuestion() {
     let alert = UIAlertController(title:"GAME OVER",message:"Your score is \(triviaBrain.getScore())", preferredStyle: .alert)
     let reStartAction = UIAlertAction(title:"Play again" ,style: .default) {_ in
       self.reStart()
     }
     alert.addAction(reStartAction)
     present(alert, animated: true, completion: nil)
   }


   func reStart() {
     score = 0
     questionNumber = 0
     triviaBrain.score = 0
     scoreLabel.text = "\(triviaBrain.getScore())"
     stopSound()
   }


   func playSound() {
     guard let url = Bundle.main.url(forResource: "clap", withExtension: "wav") else { return }

     do {
       try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
       try AVAudioSession.sharedInstance().setActive(true)
       player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)


       guard let player = player else { return }

       player.play()


     } catch let error {
       print(error.localizedDescription)
     }
   }


   func stopSound(){
     player?.stop()
   }




   func configureButtons(){

     trueButton.layer.cornerRadius = 30
     trueButton.layer.borderWidth = 3
     trueButton.layer.borderColor = UIColor.white.cgColor

     falseButton.layer.cornerRadius = 30
     falseButton.layer.borderWidth = 3
     falseButton.layer.borderColor = UIColor.white.cgColor
    
    
    questionLabel.layer.cornerRadius = 30
    questionLabel.layer.borderWidth = 3
    questionLabel.layer.borderColor = UIColor.gray.cgColor

   }

 }
