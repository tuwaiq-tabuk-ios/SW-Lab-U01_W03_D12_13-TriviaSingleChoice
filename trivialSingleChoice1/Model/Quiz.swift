
import Foundation

struct Quiz {
  
  var questionNumber = 0
  var score = 0
  
  let questions = [
    
    Question (question: "The house cat’s ancestors were social animals? ", answer : "False"),
    Question (question: "Cats were considered a sacred animal in ancient Egypt because they were domesticated?", answer : "False"),
    Question (question: "Cats’ ancestors first appeared in the Pliocene Epoch (5.3 to 3.6 million years ago)?", answer : "True"),
    Question (question: "The earliest known association between cats and humans dates to about 9,500 years ago?", answer : "True"),
    Question (question: "There are no authentic records of the domestication of cats before 1500 BCE?", answer : "True"),
    Question (question: "The Manx cat is known for its long and tufted tail?", answer : "False")
  ]
  
  
  mutating func getAnswer(_ selectedAnswer : String) -> Bool{
    let questionAnswer = questions[questionNumber].answer
     if selectedAnswer == questionAnswer {
      score += 1
      return true
    }else{
      return false
    }
  }
  
  
  func getQuestion() -> String {
    return questions[questionNumber].question
  }
  
  
  func getProgress() -> Float{
    return Float(questionNumber) / Float(questions.count)
  }
  
  
  mutating func getNextQuestion(){
    if questionNumber  <= questions.count {
      questionNumber += 1
    }else{
      questionNumber = 0
      score = 0
    }
  }
  
  
  func getScore() -> Int{
    
    return score
  }
}
