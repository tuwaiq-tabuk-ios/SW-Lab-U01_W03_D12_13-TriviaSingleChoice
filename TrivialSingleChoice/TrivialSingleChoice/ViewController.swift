//
//  ViewController.swift
//  TrivialSingleChoice
//
//  Created by macbook air on 12/03/1443 AH.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
  
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var questionLabel: UILabel!
  
  @IBOutlet weak var trueBottom: UIButton!
  @IBOutlet weak var falseBottom: UIButton!
  
  
  @IBOutlet weak var progress: UIProgressView!
  
  var questionNumber:Int = 0
  var quizManager = QuizManager()
  var score = 1
  var player: AVAudioPlayer?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    trueBottom.layer.cornerRadius = 20
    trueBottom.layer.masksToBounds = true
    
    falseBottom.layer.cornerRadius = 20
    falseBottom.layer.masksToBounds = true
  
    
    updateUI()
    progress.progress = 0.0
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
    
    Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    
    
    if quizManager.nextQuestion() {
      
    }
    else {
      showAlertView()
      
    }
  }
  
  
  @objc func updateUI(){
    questionLabel.text = quizManager.checkQuestion()
    progress.progress = quizManager.checkProgress()
    scoreLabel.text = "Score: \(quizManager.checkScore())"
    
    
    trueBottom.backgroundColor = UIColor.clear
    falseBottom.backgroundColor = UIColor.clear
    
    
    trueBottom.setTitle(quizManager.checkChoices()[0], for: .normal)
    falseBottom.setTitle(quizManager.checkChoices()[1], for: .normal)
    
  }
  
  
  func showAlertView() {
    let alert = UIAlertController(title: "End game 🥳", message: "play agine?", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Yes", style: .cancel, handler: {action in
      print("Yes clicked")
    }))
    alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
    present(alert, animated: true, completion: nil)
    playSound()
  }
  
  
  func playSound() {
    guard let url = Bundle.main.url(forResource: "clapping", withExtension: "mp3") else { return }
    
    do {
      try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
      try AVAudioSession.sharedInstance().setActive(true)
      
      /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
      player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
      
      /* iOS 10 and earlier require the following line:
       player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
      
      guard let player = player else { return }
      
      player.play()
      
    } catch let error {
      print(error.localizedDescription)
    }
  }
  }


