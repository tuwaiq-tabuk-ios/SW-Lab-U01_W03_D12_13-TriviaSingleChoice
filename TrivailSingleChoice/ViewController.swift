//
//  ViewController.swift
//  TrivailSingleChoice
//
//  Created by محمد العطوي on 12/03/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numberOfQuestionLabel: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var score: UILabel!
    
    
    @IBOutlet weak var questionsLabel: UILabel!
    
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionB: UIButton!
    
    @IBOutlet weak var progresView: UIProgressView!

    var counterScore:Int = 0
    var questionNumber:Int = 0
    var selectedAnswer:Int = 0
    
    var allQuestion = QuestionBank ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateQuestion()
        updateInterFace()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func answer(_ sender: UIButton) {
        
        if sender.tag == selectedAnswer {
            print("Correct")
            counterScore += 1
            if selectedAnswer == 1{
                optionA.tintColor = .green
            }else{
                optionB.tintColor = .green
            }
        }else{
            print("incorrect")
            if selectedAnswer == 1{
                optionB.tintColor = .red
            }else{
                optionA.tintColor = .red
            }
        }
        questionNumber += 1
        next()
        
    }
    
    func next()  {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)){
            self.updateQuestion()
        }
    }
    func updateQuestion() {
        if questionNumber <= allQuestion.list.count - 1{
            questionsLabel.text = allQuestion.list [questionNumber].question
            selectedAnswer = allQuestion.list [questionNumber].correctAnswer
            optionA.setTitle(allQuestion.list[questionNumber].optionA, for: .normal)
            optionB.setTitle(allQuestion.list[questionNumber].optionB, for: .normal)
            updateInterFace()
        } else {
            let alert = UIAlertController(title: "alert" , message: "Do you want to start over ?",preferredStyle: .alert)
            let reStartAction = UIAlertAction(title: "Yes", style: .default, handler: { action in self.reStart()})
            alert.addAction(reStartAction)
            present(alert, animated: true, completion: nil)
            
        }
    }
    
    
    func updateInterFace() {
        score.text = "score \(counterScore)"
        numberOfQuestionLabel.text = "\(questionNumber + 1)/\(allQuestion.list.count)"
        progresView.progress = Float(Float(questionNumber + 1) / Float(allQuestion.list.count))
        
        optionA.tintColor = .black
        optionB.tintColor = .black
    }
    
    
    func reStart() {
        counterScore = 0
        questionNumber = 0
        updateQuestion()
    }
    
}




