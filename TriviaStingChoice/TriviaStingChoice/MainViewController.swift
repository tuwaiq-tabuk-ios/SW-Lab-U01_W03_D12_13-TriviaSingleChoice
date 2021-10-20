//
//  MainViewController.swift
//  TrivialStingChoice
//
//  Created by Marzouq Almukhlif on 13/03/1443 AH.
//

import UIKit

class MainViewController: UIViewController {
  
  
  @IBOutlet weak var heartButton: UIButton!
  @IBOutlet weak var progressQuestions: UIProgressView!
  
  var countHearts: Int = 0
  var questionNumber: Int = 0
  var allQuestions = QuestionBank()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    updateData()
    updateUI()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    updateUI()

  }
  
  @IBAction func menuButtonPressed(_ sender: Any) {
       

          
    
  }
  
  @IBAction func playButtonPressed(_ sender: UIButton) {
    // alertView
    // passToQuestionView
    if (UserDefaults.standard.integer(forKey: "qusetionNumber") != 0) {
      performSegue(withIdentifier: "alertView", sender: self)
    }else{
      performSegue(withIdentifier: "passToQuestionView", sender: self)

    }

  }
  
  
  
  func updateData() {
    
    // data for Hearts
    if (UserDefaults.standard.object(forKey: "hearts") == nil) {
      UserDefaults.standard.set(10, forKey: "hearts")
    }
    countHearts = UserDefaults.standard.integer(forKey: "hearts")
    
    // data for Questions
    if (UserDefaults.standard.object(forKey: "qusetionNumber") == nil) {
      UserDefaults.standard.set(0, forKey: "qusetionNumber")
    }
    questionNumber = UserDefaults.standard.integer(forKey: "qusetionNumber")
    
  }
  
  func updateUI() {
    heartButton.setTitle("x\(countHearts)", for: .normal)
    progressQuestions.progress = Float(Float(questionNumber + 1) / Float(allQuestions.list.count))
    
  }
  
  
  
}
