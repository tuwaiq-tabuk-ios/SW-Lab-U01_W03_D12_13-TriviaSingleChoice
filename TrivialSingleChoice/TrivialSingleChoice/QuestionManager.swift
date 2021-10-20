//

//

import Foundation
struct QuizManager {
  
  let questions = [
    
    Question(question: "Saudi National Day is 18-Julay", choices: ["True","false"], answer: "false"),
    Question(question: "The number of Ocean in the world is 5 ocean", choices: ["True","false"], answer: "True"),
    Question(question: "Heart is the largest organ in the human body", choices: ["True","false"], answer: "false"),
    Question(question: "A lion is a pet", choices: ["True","false"], answer: "false"),
    Question(question: "Eastern is the larges trehoin in the KSA", choices: ["True","false"], answer: "True")]
  
  private var questionNumber = 0;
  var score = 0;
  
  
  mutating func checkAnswer(_ userAnswer:String) -> Bool {
    print(userAnswer)
    print(questions[questionNumber].answer)
    if userAnswer == questions[questionNumber].answer{
      score+=1
      return true;
    }
    return false;
  }
  
  func checkQuestion() -> String {
    return questions[questionNumber].question
  }
  
  
  func checkChoices() -> [String] {
    return questions[questionNumber].choices
  }
  
  
  func checkProgress() -> Float {
    return Float(questionNumber) / Float(questions.count);
  }
  
  
  func checkScore() -> Int {
    return score
  }
  
  
  func getQuestionNumber() -> Int {
    return questionNumber
  }
  
  
  mutating func nextQuestion() -> Bool {
    questionNumber += 1
    if (questionNumber == questions.count) {
      questionNumber += 1
      return true
    }
    else {
      return false
    }
  }
}
