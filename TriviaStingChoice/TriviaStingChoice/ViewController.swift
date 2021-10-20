//
//  ViewController.swift
//  TrivialStingChoice
//
//  Created by Marzouq Almukhlif on 12/03/1443 AH.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
  
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var questionNumberLabel: UILabel!
  @IBOutlet weak var questionTextView: UITextView!
  @IBOutlet weak var progressView: UIProgressView!
  @IBOutlet weak var optionA: UIButton!
  @IBOutlet weak var optionB: UIButton!
  @IBOutlet weak var heartButton: UIButton!
  
  
  
  let allQuestions = QuestionBank()
  var score: Int = 0
  var questionNumber: Int = 0
  var selectedAnswer: Int = 0
  var countHearts: Int = 0
  var player: AVAudioPlayer?
  var correctCount:Int = 0
  
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    updateData()
    updateHandler()
    
  }
  
  
  @IBAction func dismissQuestion(_ sender: Any) {
    performSegue(withIdentifier: "backToMain", sender: self)
    
  }
  
  @IBAction func skipQuestion(_ sender: Any) {
    countHearts -= 1
    correctCount = 0
    playAlarm("Incorrect")
    UserDefaults.standard.set(countHearts, forKey: "hearts")
    heartButton.setTitle("x\(countHearts)", for: .normal)
    questionNumber += 1
    next()
  }
  
  @IBAction func askFriends(_ sender: UIButton) {
    let bounds = UIScreen.main.bounds
    UIGraphicsBeginImageContextWithOptions(bounds.size, true, 0.0)
    self.view.drawHierarchy(in: bounds, afterScreenUpdates: false)
    let img = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    let activityViewController = UIActivityViewController(activityItems: [img!], applicationActivities: nil)
    self.present(activityViewController, animated: true, completion: nil)
  }
  
  
  @IBAction func answerButtonPressed(_ sender: UIButton) {
    optionA.isUserInteractionEnabled = false
    optionB.isUserInteractionEnabled = false
    if sender.tag == selectedAnswer {
      playAlarm("Correct")
      correctCount += 1
      if selectedAnswer == 1 {
        optionA.backgroundColor = .systemGreen
      }else{
        optionB.backgroundColor = .systemGreen
      }
      score += 1
    }else{
      playAlarm("Incorrect")
      if selectedAnswer == 1 {
        optionB.backgroundColor = .systemRed
      }else{
        optionA.backgroundColor = .systemRed
      }
      correctCount = 0
      countHearts -= 1
      UserDefaults.standard.set(countHearts, forKey: "hearts")
      heartButton.setTitle("x\(countHearts)", for: .normal)
      
    }
    questionNumber += 1
    next()
    
  }
  
  
  
  
  func next() {
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
      self.updateQuestion()
    })
  }
  

  func updateQuestion(){
    if correctCount == 3 {
      countHearts += 1
      alertShow(1)
    }else if correctCount == 5 {
      countHearts += 3
      alertShow(3)
    }else if correctCount > 9 && correctCount < 15{
      countHearts += 5
      alertShow(5)
    }else if correctCount > 15 && correctCount < 30{
      countHearts += 5
      alertShow(5)
    }
    
    if questionNumber <= allQuestions.list.count - 1 {
      UserDefaults.standard.set(questionNumber, forKey: "qusetionNumber")
      questionTextView.text = allQuestions.list[questionNumber].question
      selectedAnswer = allQuestions.list[questionNumber].correctAnswer
      optionA.setTitle(allQuestions.list[questionNumber].optionA, for: .normal)
      optionB.setTitle(allQuestions.list[questionNumber].optionB, for: .normal)
      updateInterface()
    } else {
      let alert = UIAlertController(title: "Alert", message: "Do you want to start over?", preferredStyle: .alert)
      
      let restartAction = UIAlertAction(title: "Yes", style: .default, handler: {action in self.restart()})
      
      alert.addAction(restartAction)
      present(alert, animated: true, completion: nil)
      
    }
    
  }
  
  
  func updateInterface() {
    scoreLabel.text = "Score: \(score)"
    questionNumberLabel.text = "Question \(questionNumber + 1) of \(allQuestions.list.count)"
    progressView.progress = Float(Float(questionNumber + 1) / Float(allQuestions.list.count))
    optionA.backgroundColor = .clear
    optionB.backgroundColor = .clear
    
    optionA.isUserInteractionEnabled = true
    optionB.isUserInteractionEnabled = true
  }
  
  func restart() {
    score = 0
    questionNumber = 0
    correctCount = 0
    updateQuestion()
  }
  
  
  
  func updateData() {
    // data for Hearts
    if (UserDefaults.standard.object(forKey: "hearts") == nil) {
      UserDefaults.standard.set(10, forKey: "hearts")
    }
    countHearts = UserDefaults.standard.integer(forKey: "hearts")
    
    // data for Questions
    if (UserDefaults.standard.object(forKey: "qusetionNumber") == nil) {
      UserDefaults.standard.set(0, forKey: "qusetionNumber")
    }
    questionNumber = UserDefaults.standard.integer(forKey: "qusetionNumber")
    
    
    // data for score
    if (UserDefaults.standard.object(forKey: "score") == nil) {
      UserDefaults.standard.set(0, forKey: "score")
    }
    score = UserDefaults.standard.integer(forKey: "qusetionNumber")
    
    // data for correct answer
    if (UserDefaults.standard.object(forKey: "correctAnswer") == nil) {
      UserDefaults.standard.set(0, forKey: "correctAnswer")
    }
    correctCount = UserDefaults.standard.integer(forKey: "correctAnswer")
    print("correctCountcorrectCount == \(correctCount)")
    heartButton.setTitle("x\(countHearts)", for: .normal)
    
  }
  
  
  func updateHandler() {
    updateQuestion()
    updateInterface()
  }
  
  
  func playAlarm(_ name:String) {
    guard let url = Bundle.main.url(forResource: name, withExtension: "mp3") else { return }
    
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
  
  func stopAlarm() {
    player?.stop()
  }
  
  
  func alertShow(_ count:Int) {
    let alert = UIAlertController(title: "Congratulation", message: "You answered \(correctCount) questions correctly and we added \(count) hearts", preferredStyle: .alert)
    
    let okAction = UIAlertAction(title: "Thanks", style: .default, handler: {action in alert.dismiss(animated: true, completion: nil)})
    
    alert.addAction(okAction)
    present(alert, animated: true, completion: nil)
  }
  
}

