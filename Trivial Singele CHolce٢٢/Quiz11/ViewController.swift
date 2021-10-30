
import UIKit

class ViewController: UIViewController {
  
  
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var scoreNumLabel: UILabel!
  @IBOutlet weak var questionLabel: UILabel!
  @IBOutlet weak var progressBar: UIProgressView!
  @IBOutlet weak var trueButton: UIButton!
  @IBOutlet weak var falseButton: UIButton!
  
  private var viewModel: ViewModel = ViewModel()
  override func viewDidLoad() {
    super.viewDidLoad()
    update()
    
  }
  
  
  @IBAction func trueAction(_ sender: Any) {
    if viewModel.check(answer: true)
    {
      trueButton.layer.backgroundColor = .init(red: 0, green: 255, blue: 0, alpha: 1)
      
    } else
    
    {
      trueButton.layer.backgroundColor = .init(red:255, green: 0, blue: 0, alpha: 1)
      
      
    }
    
    DispatchQueue.main.asyncAfter(deadline: .now()+1) {
      self.nextQuestion()
      
      self.trueButton.layer.backgroundColor = .init(red: 255, green: 255, blue: 255, alpha: 1)
      
      
      
    }
    
    
  }
  func nextQuestion() {
    if viewModel.currentQuestionIndex < viewModel.questions.count-1 {
      viewModel.currentQuestionIndex += 1
      update()
    } else {
      let alert = UIAlertController(title: "Done",
                                    message: "",
                                    preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "Start Again", style: .default, handler: self.startOver))
      self.present(alert, animated: true)
    }
    
  }
  func startOver(_ action: UIAlertAction) {
    viewModel.score = 0
    viewModel.currentQuestionIndex = 0
    update()
  }
  
  @IBAction func falseAction(_ sender: Any) {
    if viewModel.check(answer: false)==false
    {
      falseButton.layer.backgroundColor = .init(red: 0, green: 255 , blue: 0, alpha: 1)
      
      
    } else
    {
      falseButton.layer.backgroundColor = .init(red:255, green: 0, blue: 0, alpha: 1)
      
      
    }
    
    DispatchQueue.main.asyncAfter(deadline: .now()+1) {
      self.nextQuestion()
      self.falseButton.layer.backgroundColor = .init(red: 255, green: 255, blue: 255, alpha: 1)
    }
    
  }
  //    @objc func fireTimer() {
  //        print("Timer fired!")
  //        if counter<time{
  //            counter+=1
  //        }else{
  //            counter=0
  //            timer?.invalidate()
  //            if current<questions.count-1{
  //                current+=1
  //            }else{
  //                current=0
  //                score=0
  //                self.scoreNumLabel.text="\(self.score)"
  //            }
  //            questionLabel.text=questions[current]
  //            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
  //        }
  //        progressBar.progress=1-(Float(counter)*0.1)
  //    }
  
  func update() {
    questionLabel.text = viewModel.question.question
    let total = Float(Float(viewModel.currentQuestionIndex + 1) /  Float(viewModel.questions.count)) * 100.0
    print(total)
    print(total * 0.01)
    progressBar.progress = total * 0.01
    trueButton.layer.backgroundColor = .init(red: 255, green: 255, blue: 255, alpha:1)
    trueButton.layer.cornerRadius=30
    falseButton.layer.backgroundColor = .init(red: 255, green: 255, blue: 255, alpha: 1)
    falseButton.layer.cornerRadius=30
    scoreNumLabel.text="\(viewModel.score)"
    
  }
  
}


