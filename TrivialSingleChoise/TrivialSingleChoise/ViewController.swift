//
//  ViewController.swift
//  TrivialSingleChoise
//
//  Created by arwa balawi on 13/03/1443 AH.
//
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var question = Question2()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        trueButton.layer.cornerRadius = 8
        trueButton.layer.borderWidth = 3
        trueButton.layer.borderColor = UIColor.black.cgColor
        falseButton.layer.cornerRadius = 8
        falseButton.layer.borderWidth = 3
        falseButton.layer.borderColor = UIColor.black.cgColor    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        
        let userGotItRight = question.checkAnswer(userAnswer: userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        question.nextQuestion()
        if question.questionNumber == 0 {
            ShowAlert()
        }
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = question.getQuestionText()
        progressView.progress = question.getProgress()
        scoreLabel.text = "Score: \(question.getScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
    func ShowAlert(){
        let alert = UIAlertController(title: "Questions are done", message: "Start again", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))


        self.present(alert, animated: true)
        
       //return showToast("Message")
    }
    
    
    
   
    }
    

