//
//  HeartsViewController.swift
//  TrivialStingChoice
//
//  Created by Marzouq Almukhlif on 13/03/1443 AH.
//

import UIKit

class HeartsViewController: UIViewController {

  @IBOutlet weak var heartButton: UIButton!
  
  var countHearts: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
      
      countHearts = UserDefaults.standard.integer(forKey: "hearts")
      updateUI()

      
    }
  
  override func viewDidAppear(_ animated: Bool) {
    updateUI()
  }

  

  func updateUI() {
    heartButton.setTitle("x\(countHearts)", for: .normal)
  }
  
  @IBAction func addFreeHeart(_ sender: UIButton) {
    if sender.tag == 1 {
      if !UserDefaults.standard.bool(forKey: "1Free"){
      countHearts += 1
      UserDefaults.standard.set(countHearts, forKey: "hearts")
      UserDefaults.standard.set(true, forKey: "1Free")
      }else{
        alert(sender.tag)
      }
    }else{
      if !UserDefaults.standard.bool(forKey: "3Free"){
      countHearts += 3
      UserDefaults.standard.set(countHearts, forKey: "hearts")
        UserDefaults.standard.set(true, forKey: "3Free")

      }else{
        alert(sender.tag)
      }

    }
    
    viewDidAppear(false)
    
    
  }
  
  func alert(_ number:Int) {
    let alert = UIAlertController.init(title: "Sorry!", message: "Sorry you have reached the maximum limit of \(number) hearts\n", preferredStyle: .alert)
    let okAction = UIAlertAction.init(title: "OK", style: .default) { action in
      alert.dismiss(animated: true, completion: nil)
    }
    alert.addAction(okAction)
    present(alert, animated: true, completion: nil)
  }
  
    

}
