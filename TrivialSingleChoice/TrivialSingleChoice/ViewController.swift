
import UIKit
import Foundation


struct QuizQuestion {
    var question: String
    var answer : Bool
    
    
}

class ViewController: UIViewController {
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var valueScoreLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var trueButton: UIButton!
    
    @IBOutlet weak var falseButton: UIButton!
    
    
    private let questions = [QuizQuestion(
                                question: "API stands for Application Programming Interface",
                                answer: true),
                             QuizQuestion(
                                question: "Berlin is the capital of Germany",
                                answer: true),
                             QuizQuestion(
                                question: "Halloween is always celebrated on October 21",
                                answer: false),
                             QuizQuestion(
                                question: "Cape Town is the capital of Nourth Africa",
                                answer: false)]
    
    
    private  var currentQuestionIndex = 0
    private  var score = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.questionLabel.text =  questions[currentQuestionIndex].question
        progressBar.progress = 0
    }
    
    
    func configureButtons() {
        
        trueButton.layer.cornerRadius = 20
        trueButton.layer.borderWidth = 3
        trueButton.layer.borderColor = UIColor.black.cgColor
        
        falseButton.layer.cornerRadius = 20
        falseButton.layer.borderWidth = 3
        falseButton.layer.borderColor = UIColor.black.cgColor
        
        configureButtons()
    }
    
    
    @IBAction func answerPressed(_ sender: UIButton) {
        
        if currentQuestionIndex >= questions.count { return }
        
        let userAnswer = sender.currentTitle
        let isAnswerCorrect = userAnswer?.toBool() == questions[currentQuestionIndex].answer
        
        if isAnswerCorrect {
            score += 1
            valueScoreLabel.text = "\(score)"
            sender.backgroundColor = .systemGreen
            
        } else {
            score -= 1
            valueScoreLabel.text = "\(score)"
            sender.backgroundColor = .systemRed
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5,
                                      execute: {
                                        sender.backgroundColor = UIColor.clear
                                        
                                      })
        
        currentQuestionIndex += 1
        progressBar.progress += 0.25
        
        
        let isThereAnyQuestionsLeft = currentQuestionIndex < questions.count
        if isThereAnyQuestionsLeft {
            questionLabel.text = questions[currentQuestionIndex].question
        } else {
            showGameOverAlertMessage()
        }
        
        
        func showGameOverAlertMessage() {
            
            let alarm = UIAlertController(
                title: "Quiz Over",
                message: "Your score is \(score) out of 4",
                preferredStyle: .alert
            )
            alarm.addAction(UIAlertAction(title: "OK", style: .default))
            present(alarm, animated: true)
        }
        
    }
    
}

extension String {
    func toBool() -> Bool? {
        switch self {
        case "True", "true", "yes", "1":
            return true
        case "False", "false", "no", "0":
            return false
        default:
            return nil
            
        }
    }
    
}
