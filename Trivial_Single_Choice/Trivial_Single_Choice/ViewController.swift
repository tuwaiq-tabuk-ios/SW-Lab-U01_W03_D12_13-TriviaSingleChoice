//
//  ViewController.swift
//  Trivial_Single_Choice
//
//  Created by Mohammed on 12/03/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet weak var questionTextLabel: UILabel!
    @IBOutlet weak var progressLoadView: UIProgressView!
    @IBOutlet weak var theOptionA: UIButton!
    @IBOutlet weak var theOptionB: UIButton!
    
    
    let questions = QuesTionBank()
    var score:Int = 0
    var questionNumber:Int = 0
    var selectedAnswer:Int = 0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTheQuestion()
        updateInterface()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        if sender.tag == selectedAnswer {
            print("Correct")
            
            if selectedAnswer == 1 {
                theOptionA.backgroundColor = .green
                
            }else{
                
                theOptionB.backgroundColor = .green
            }
            score += 1
            
        }else{
            
            if selectedAnswer == 1 {
                theOptionB.backgroundColor = .red
                
            }else{
                
                theOptionA .backgroundColor = .red
            }
            print("Incorrect")
        }
        
        questionNumber += 1
        next()
    }
    
    func next() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1) ,execute: {
            self.updateTheQuestion()
        })
        
    }
    //this function is for moving between questions
    func updateTheQuestion(){
        
        if questionNumber <= questions.list.count - 1 {
            questionTextLabel.text = questions.list[questionNumber].question
            selectedAnswer = questions.list[questionNumber].theCorrectAnswer
            theOptionA.setTitle(questions.list[questionNumber].optionA, for: .normal)
            theOptionB.setTitle(questions.list[questionNumber].optionB, for: .normal)
            updateInterface()
            
        }else{
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            let alert = UIAlertController(title: "Great work!", message:"Do Want to give it another shot?", preferredStyle: .alert)
            let reStartAction = UIAlertAction(title: "Yes", style: .default) { action in self.reStart()}
            alert.addAction(reStartAction)
            present(alert, animated: true, completion: nil)
       
        
        
        
        
        
        
            
            
            
            
            
            
            
        
        }
        
    }
    
    
    //this function is for Score label
    func updateInterface(){
        scoreLabel.text = "\(score)"
        questionNumberLabel.text = "\(questionNumber + 1)/\(questions.list.count)"
        progressLoadView.progress = Float(Float(questionNumber + 1) / Float (questions.list.count))
        theOptionA.backgroundColor = .link
        theOptionB.backgroundColor = .link


        
    }
    
    func reStart(){
        score = 0
        questionNumber = 0
        updateTheQuestion()
    }
    
}

