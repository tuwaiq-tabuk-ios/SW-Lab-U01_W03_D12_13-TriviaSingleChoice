
import Foundation
struct QuizManager {
    
    let quiz = [
        
        Question(question: "The language of Saudi Arabia is English?", choices: ["True", "False"], answer: "False"),
        Question(question: "Riyadh capital of Saudi?", choices: ["True", "False"], answer: "True"),
        Question(question: "there are mor then 35 universities  in Saudi?", choices: ["True", "False"], answer: "True"),
        Question(question: "The rule of Saudi Arabia so far 7 kings?", choices: ["True", "False"], answer: "True"),
        Question(question: "currency of Saudi is riyal?", choices: ["True", "False"], answer: "True"),
        Question(question: "Saudi Arabia in Asia?", choices: ["True", "False"], answer: "True"),
        Question(question: "The world consists of 8 continents", choices: ["True", "False"], answer: "False"),
        Question(question: "Is the earth round?", choices: ["True", "False"], answer: "True"),
        
    ]
    
    var questionNumber = 0;
    var score = 0;
    
    
    mutating func checkAnswer(_ userAnswer:String) -> Bool {
        print(userAnswer)
        print(quiz[questionNumber].answer)
        if userAnswer == quiz[questionNumber].answer{
            score+=1
            return true;
        }
        return false;
    }
    
    func checkQuestion() -> String {
        return quiz[questionNumber].question
    }
    func checkChoices() -> [String] {
        return quiz[questionNumber].choices
    }
    func checkProgress() -> Float {
        return Float(questionNumber) / Float(quiz.count);
    }
    func checkScore() -> Int {
        return score
    }
    
    mutating func nextQuestion() ->Bool {
        questionNumber += 1
        if (questionNumber == quiz.count) {
            questionNumber=0
            score = 0;
            return false
        }
        else{
            return true
            
        }
    }
    
    
}
