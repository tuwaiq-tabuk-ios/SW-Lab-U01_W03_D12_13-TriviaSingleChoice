//
//  ViewController.swift
//  Trivia-Single-Choice
//
//  Created by Aisha Ali on 10/18/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
  
  var score = 0
  var currentProgress = 0
  var quetions : questionsAndAnswers = questionsAndAnswers()
  var audioPlayer:AVAudioPlayer = AVAudioPlayer()
  var count = 0
  var timer:Timer = Timer()
  var showingScore = false
  
  
  
  ///
  
  @IBOutlet weak var questionLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var progressViewBar: UIProgressView!
  @IBOutlet weak var trueButton: UIButton!
  @IBOutlet weak var falseButton: UIButton!
  @IBOutlet weak var questionsView: UIView!
  @IBOutlet weak var scoreView: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //True button
    trueButton.backgroundColor = .clear
    trueButton.layer.cornerRadius = 30
    trueButton.layer.borderWidth = 1
    trueButton.layer.borderColor = UIColor.darkGray.cgColor
    
    //False button
    falseButton.backgroundColor = .clear
    falseButton.layer.cornerRadius = 30
    falseButton.layer.borderWidth = 1
    falseButton.layer.borderColor = UIColor.darkGray.cgColor
    
    // score Label
    scoreLabel.backgroundColor = .clear
    scoreLabel.textColor = .white
    
    
    // Score View
    scoreView.backgroundColor = .gray
    scoreView.layer.cornerRadius = 20
    scoreView.layer.borderWidth = 2
    scoreView.layer.borderColor = UIColor.darkGray.cgColor
    
    //Questions Label
    questionsView.layer.cornerRadius = 30
    questionsView.layer.borderWidth = 10
    questionsView.layer.borderColor = UIColor.darkGray.cgColor
    
    // Progree View
    progressViewBar.progress = 0.0
    scoreLabel.text = "Score : \(score)"
    resultProgress()
    
  }
  
  @IBAction func selectAnswerPressed(_ sender: UIButton) {
    
    let selectedValue = sender.currentTitle!
    
    let isCorrect = quetions.getAnswer(selectedValue)
    
    if isCorrect {
      sender.backgroundColor = UIColor.green
    }else{
      sender.backgroundColor = UIColor.red
    }
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
      sender.backgroundColor = UIColor.clear
    })
    
    if quetions.getNextQuestion() {
      timer = Timer.scheduledTimer(timeInterval: 0.5
                                   , target: self
                                   , selector: #selector(resultProgress)
                                   , userInfo: nil
                                   , repeats: true)
    }else {
      resultAlert()
    }
  }
  
  
  @objc func resultProgress(){
    
    //        progressViewBar.progress = quetions.getProgress()
    if quetions.questionNumber <= quetions.questions.count  {
      progressViewBar.setProgress(Float(quetions.getProgress()), animated: true)
      questionLabel.text = quetions.getQuestion()
      scoreLabel.text = "Score : \(quetions.getScore())"
    }
  }
  
  
  func resultAlert(){
    
    if quetions.getScore() >= 5{
      playSound(name: "clap")
    }else{
      playSound(name: "fail")
    }
    let resetAlert = UIAlertController(title: "The Game is Over"
                                       , message: "Your Score is \(quetions.getScore()) out of 10"
                                       , preferredStyle: .alert)
    
    resetAlert.addAction(UIAlertAction(title: "Play Again",
                                       style: UIAlertAction.Style.default
                                       ,handler: (startAgain)))
    present(resetAlert, animated: true)
    
  }
  
  
  func startAgain(action:UIAlertAction! = nil){
    quetions.startGame()
    resultProgress()
    audioPlayer.stop()
  }
  
  
  func playSound(name:String) {
    
    if  let pathSound = Bundle.main.path(forResource: name, ofType: "wav"){
      let url = URL(fileURLWithPath: pathSound)
      audioPlayer = try! AVAudioPlayer(contentsOf: url)
      audioPlayer.play()
    }
    print("yeeeeeeessssssss")
  }
}

