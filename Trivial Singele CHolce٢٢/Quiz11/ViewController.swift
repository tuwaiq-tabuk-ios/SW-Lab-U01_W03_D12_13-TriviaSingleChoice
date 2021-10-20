
import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var scoreNumLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    let questions:[String]=["Q1The computer is made up of software and hardware?","Q2 The printer is a hardware device?","Q3 microphone from output devi?","Q4 Keyboard of modular and modular release?","Q5 The screen is from the input units only?","Q6Swift is open source?","Q7The computer has memory?","Q8printer output unit?","Q9headphone input unit؟","Q10barcode output unit"]
    let answers:[Bool]=[true,true,false,false,false,true,true,true,false,false]
    var current:Int=0
    var timer : Timer?
    var time = 10
    var counter = 0
    var score = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text=questions[current]
        trueButton.layer.backgroundColor = .init(red: 255, green: 255, blue: 255, alpha:1)
        trueButton.layer.cornerRadius=30
        falseButton.layer.backgroundColor = .init(red: 255, green: 255, blue: 255, alpha: 1)
        falseButton.layer.cornerRadius=30
        scoreNumLabel.text="\(score)"
       
    }
    
    
    @IBAction func trueAction(_ sender: Any) {
        if answers[current]==true
        {
            trueButton.layer.backgroundColor = .init(red: 0, green: 255, blue: 0, alpha: 1)
            score+=1
            
        } else if answers[current]==false
        {
            trueButton.layer.backgroundColor = .init(red:255, green: 0, blue: 0, alpha: 1)
            
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            self.counter=0
            self.timer?.invalidate()
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.fireTimer), userInfo: nil, repeats: true)
            self.trueButton.layer.backgroundColor = .init(red: 255, green: 255, blue: 255, alpha: 1)
           
            self.scoreNumLabel.text="\(self.score)"
            
        }
        
        if current<questions.count-1{
            current+=1
        
        }else{
            current=0
            score=0
            self.scoreNumLabel.text="\(self.score)"
        }
            
        questionLabel.text=questions[current]
    }
    
    
    @IBAction func falseAction(_ sender: Any) {
        if answers[current]==false
        {
            falseButton.layer.backgroundColor = .init(red: 0, green: 255 , blue: 0, alpha: 1)
            score+=1
            
        } else if answers[current]==true
        {
            falseButton.layer.backgroundColor = .init(red:255, green: 0, blue: 0, alpha: 1)
        
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            self.counter=0
            self.timer?.invalidate()
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.fireTimer), userInfo: nil, repeats: true)
            self.falseButton.layer.backgroundColor = .init(red: 255, green: 255, blue: 255, alpha: 1)
            self.scoreNumLabel.text="\(self.score)"
        }
        if current<questions.count-1{
            current+=1
        }else{
            current=0
            score=0
            self.scoreNumLabel.text="\(self.score)"
        }
        questionLabel.text=questions[current]
    }
    @objc func fireTimer() {
        print("Timer fired!")
        if counter<time{
            counter+=1
        }else{
            counter=0
            timer?.invalidate()
            if current<questions.count-1{
                current+=1
            }else{
                current=0
                score=0
                self.scoreNumLabel.text="\(self.score)"
            }
            questionLabel.text=questions[current]
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
        } 
        progressBar.progress=1-(Float(counter)*0.1)
    }
    
}

