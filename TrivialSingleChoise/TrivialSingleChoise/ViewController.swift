//
//  ViewController.swift
//  TrivialSingleChoise
//
//  Created by ahlam  on 12/03/1443 AH.
//


import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var qusetionLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var triviaBrain = TriviaBrain()
    var score : Int = 0
    var questionNumber = 0
    
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
       configureButtons()

    }
    
    
    @IBAction func answerButtonPresswd(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        
        let userGotItRight = triviaBrain.checkAnswer(userAnswer: userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        triviaBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        if triviaBrain.questionNumber == 0 {

            updateQuestion()
            playSound()
        }
        
        //updateQuestion()
    }
    
    
    @objc func updateUI() {
        qusetionLabel.text = triviaBrain.getQuestionText()
        progressView.progress = triviaBrain.getProgress()
        scoreLabel.text = "Score: \(triviaBrain.getScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    func updateQuestion() {
        let alert = UIAlertController(title:"GAME OVER",message:"Your scroes is \(triviaBrain.getScore())", preferredStyle: .alert)
        let reStartAction = UIAlertAction(title:"alert" ,style: .default) {_ in
            self.reStart()
        }
        alert.addAction(reStartAction)
        present(alert, animated: true, completion: nil)
    }
    
    
    
    func reStart() {
        score = 0
        questionNumber = 0
        triviaBrain.score = 0
        scoreLabel.text = "Score: \(triviaBrain.getScore())"
      stopSound()
     }
  
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "Clapping Sound Effects - Applause - Audience - Crowd Sound Effect (128  kbps) (shabakngy.com)", withExtension: "mp3") else { return }
        
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
    
    
    func stopSound(){
        player?.stop()
    }
  
    func configureButtons(){
    trueButton.layer.cornerRadius = 10
    trueButton.layer.borderWidth = 3
    trueButton.layer.borderColor = UIColor.black.cgColor
    falseButton.layer.cornerRadius = 10
    falseButton.layer.borderWidth = 3
    falseButton.layer.borderColor = UIColor.black.cgColor
    

    
}
}
