import UIKit

import AVFoundation
class ViewController: UIViewController {
  var player : AVAudioPlayer?
  //label
  @IBOutlet weak var quastionLbabel: UILabel!
  @IBOutlet weak var score: UILabel!
  //viewScore
  @IBOutlet weak var scoreView: UIView!
  //buttons
  @IBOutlet weak var TrueButtn: UIButton!
  @IBOutlet weak var FalseButtn: UIButton!
  //views
  @IBOutlet weak var questionView: UIView!
  @IBOutlet weak var falseView: UIView!
  @IBOutlet weak var TrueView: UIView!
  //progresss
  @IBOutlet weak var progressBar: UIProgressView!
  //structArray
  var currenrQuastion:QuastionBank = QuastionBank()
  
  override func viewDidLoad() {
    
    
    super.viewDidLoad()
    
    //TrueButton
    TrueButtn.layer.cornerRadius = 30
    TrueButtn.layer.borderWidth = 2
    TrueButtn.layer.borderColor = UIColor.gray.cgColor
    //falseButton
    FalseButtn.layer.cornerRadius = 30
    FalseButtn.layer.borderWidth = 2
    FalseButtn.layer.borderColor = UIColor.gray.cgColor
    
    //QuastionView
    questionView.layer.cornerRadius = 30
    questionView.layer.borderWidth = 2
    questionView.layer.borderColor = UIColor.black.cgColor
    //
    quastionLbabel.backgroundColor = .clear
    
  
    scoreView.layer.cornerRadius = 30
    
    //
    score.layer.cornerRadius = 20
    score.layer.borderWidth = 2
    score.layer.borderColor = UIColor.lightGray.cgColor
    
    
    //trueView
    falseView.layer.cornerRadius = 30
    falseView.layer.borderWidth = 2
    falseView.layer.borderColor = UIColor.gray.cgColor
    
    
    //falseView
    TrueView.layer.cornerRadius = 30
    TrueView.layer.borderWidth = 2
    TrueView.layer.borderColor = UIColor.gray.cgColor
    
    
      
    
    
    
    score.text = " score \(currenrQuastion.getScore())"
    updateCounter()
    
  }
  
  @IBAction func buttons(_ sender: UIButton){
    
//    guard let userAnswer1 = sender.currentTitle else {
//      print ("ERROR: button do't have title property set in storyboard")
//      return
//    }
     let selectedButton = sender.currentTitle!
    
    
    let userAnswer = currenrQuastion.checkAnswer(selectedButton)//PPPP
    
    if userAnswer {
      
      sender.backgroundColor = UIColor.green
      
    }else{
      sender.backgroundColor = UIColor.red
    }
    

  if currenrQuastion.nextQuestion() {

  Timer.scheduledTimer(timeInterval: 1.0,
  target: self,
  selector: #selector(updateCounter),
  userInfo: nil,
  repeats: false )

  }
  else {


    showGameOverAleartMessage()
    
    playSound()
    
  }
  }
  @objc func updateCounter()  {
    
    score.text = "score : \(currenrQuastion.getScore())"
    quastionLbabel.text = currenrQuastion.getQustionText()
    progressBar.progress = currenrQuastion.getProgress()
    
    TrueButtn.backgroundColor = UIColor.clear
    FalseButtn.backgroundColor = UIColor.clear
    
    
  }
  
  func startGame (action : UIAlertAction! = nil)
  {
    print (#function)
    currenrQuastion.startGame()
     stopSound()
    
  }
  
  func showGameOverAleartMessage(){
    
    
 
    let ac = UIAlertController(
      title: "GAME OVER", message: "YOUR SCORE IS \(currenrQuastion.getScore())", preferredStyle: .alert)
    
    ac.addAction(UIAlertAction(title: "play againe", style: .default, handler: startGame))
    
    present(ac,animated: true)
  }
  
  
  func playSound() {
    
   
      guard let url = Bundle.main.url(forResource: "win", withExtension: "mp3") else { return }

      do {
          try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
          try AVAudioSession.sharedInstance().setActive(true)

    
          player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

          guard let player = player else { return }

          player.play()

      } catch let error {
          print(error.localizedDescription)
        
        
      }
  
  }
 func stopSound(){
      player?.stop()
  }
}


