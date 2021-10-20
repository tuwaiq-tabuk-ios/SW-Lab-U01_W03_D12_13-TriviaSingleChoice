import Foundation

struct  Questions {
    
    //struct properties
    var question : String
    var answer : String
    
    //method to initialize the struct
    init(q : String, a : String) {
        self.question = q
        self.answer = a
    }
    
    //getter methods
    func getQuestion() -> String {
        return self.question
    }
    
    func getAnswer() -> String {
        return self.question
    }
}


//let resetAlert = UIAlertController(title: "The Game is Over", message: "Your Score is \(quetions.getScore()) out of 10", preferredStyle: .alert)
//
//
//resetAlert.addAction(UIAlertAction(title: "Play Again", style: <#UIAlertAction.Style#>
//
//                                   , handler:startAgain))
//
//present(resetAlert, animated: true, completion: nil)
//}
