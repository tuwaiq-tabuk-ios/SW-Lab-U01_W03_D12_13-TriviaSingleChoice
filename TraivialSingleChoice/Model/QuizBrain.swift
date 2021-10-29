
import Foundation

//struct that contain all the quiz ideas and ahow its work:
struct QuizBrain {
  
  //Properties:
  var questionNumber = 0
  var score = 0
  
  //arry to display the questions and the answers:
  let questions = [
    Question ( question : "Elephants can hear with their feet.", answer : "True"),
    Question ( question : "There is no left-handed elephants.", answer : "False"),
    Question ( question : "When elephants lose a mate they can die from a broken heart.", answer : "True"),
    Question ( question : "Elephants can use their tusks to dig holes in the ground.", answer : "True"),
    Question (question: "Elephants hate mud.", answer: "False"),
    Question (question: "Only some male Asian elephants have tusks.", answer: "True"),
    Question (question: "Elephants can only sleep lying down for about 30 minutes.", answer: "True")
  ]
  
  //function that when user choose an answer it check on the answer if its correct or incorrect and if it is correct -> add 1 score:
  mutating func getAnswer(_ selectedAnswer : String) -> Bool {
    let questionAnswer = questions[questionNumber].answer
    
    if selectedAnswer == questionAnswer {
      score += 10
      return true
    } else {
      return false
    }
  }
  
  
  //function that will display the questions:
  func getQuestion() -> String {
    return questions[questionNumber].question
  }
  

  //function for progress bar to inform user about how many questions done and remain
  //to do this I devided the the number of current question over questions number(in my case there is 7 questions in the arry):
  func getProgress() -> Float{
    return Float(questionNumber) / Float(questions.count)
  }
  
  
  //functions to display next question:
  mutating func getNextQuestion() {
    if questionNumber <= questions.count {
      questionNumber += 1
    } else {
      questionNumber = 0
      score = 0
    
    }
  }
  

  //function to get the score:
  func getScore() -> Int{
    return score
  }
}

