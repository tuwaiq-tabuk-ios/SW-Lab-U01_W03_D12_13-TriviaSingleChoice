//
//  ViewController.swift
//  Trivialsinnclechoice
//
//  Created by azooz alhwiti on 12/03/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var questionosNumberLabel: UILabel!
    @IBOutlet weak var questionosLabel: UILabel!

    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var optionB: UIButton!
    
    
    var allQuestion = QuestionsBanc()
    var score : Int = 0
    var questionoNumber :Int = 0
    var seletedAnswer :Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestion()
        updateInterFace()
        // Do any additional setup after loading the view.
    }


    
    @IBAction func enswerButton(_ sender: UIButton) {
        if sender.tag == seletedAnswer {
        print ("correct")
            //if selectedAnswer == 1{
                //theOptionA.backgroundColor = .greetn
            //}
            score += 1
        }else{
        print("Incorrect")
        }
        questionoNumber += 1
        updateQuestion()
    }
    
    func updateQuestion() {
        if questionoNumber <= allQuestion.list.count - 1 {
            questionosLabel.text = allQuestion.list[questionoNumber].question
            seletedAnswer = allQuestion.list[questionoNumber].correstAnswer
            optionA.setTitle(allQuestion.list[questionoNumber].optionA, for: .normal)
            optionB.setTitle(allQuestion.list[questionoNumber].optionB, for: .normal)
            updateInterFace()
        }else{
            let alert = UIAlertController(title: "alert",message: "Do you want to start over", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "alert", style: .default, handler: {action in self.reStart()})
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
            
         
        }
    }
    
    func updateInterFace()  {
        scoreLabel.text = "score: \(score)"
        questionosNumberLabel.text = "\(questionoNumber + 1)/\(allQuestion.list.count)"
        progressView.progress = Float(Float(questionoNumber + 1) / Float( allQuestion.list.count))
    }
    
    func reStart() {
        score = 0
        questionoNumber = 0
        updateQuestion()
    }
    
}


