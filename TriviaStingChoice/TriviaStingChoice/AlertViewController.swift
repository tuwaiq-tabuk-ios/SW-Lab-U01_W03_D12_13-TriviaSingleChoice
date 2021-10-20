//
//  AlertViewController.swift
//  TrivialStingChoice
//
//  Created by Marzoog Almoklif on 14/03/1443 AH.
//

import UIKit

var rest:Bool = false
class AlertViewController: UIViewController {
  let ViewControllere = ViewController()
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let backgroundView = UIView()
    backgroundView.backgroundColor = .black
    backgroundView.layer.opacity = 0.5
    backgroundView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    self.view.addSubview(backgroundView)
    
    let alertView = UIView()
    alertView.backgroundColor = .white
    alertView.layer.cornerRadius = 20
    self.view.addSubview(alertView)
    
    alertView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
                                    alertView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: (UIScreen.main.bounds.width / 2)),
                                    alertView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 30 ),
                                    alertView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -30 ),
                                    alertView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -(UIScreen.main.bounds.width / 2 ) * 1.5 )])
    
    
    
    let titelAlert = UILabel()
    titelAlert.text = "Pause"
    titelAlert.textColor = .black
    titelAlert.textAlignment = .center
    titelAlert.font = UIFont(name:"GeezaPro-Bold", size: 16.0)
    
    alertView.addSubview(titelAlert)
    
    titelAlert.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
                                    titelAlert.topAnchor.constraint(equalTo: alertView.topAnchor, constant: 20),
                                    titelAlert.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 30 ),
                                    titelAlert.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -30 ),
                                    titelAlert.bottomAnchor.constraint(equalTo: alertView.topAnchor, constant: 70)])
    
    
    let stackView = UIStackView()
    stackView.axis = .horizontal
    //        stackView.backgroundColor = .green
    
    stackView.alignment = .fill
    stackView.distribution = .fillEqually
    alertView.addSubview(stackView)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
                                    stackView.topAnchor.constraint(equalTo: alertView.bottomAnchor, constant: -70),
                                    stackView.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: alertView.bounds.width / 2 ),
                                    stackView.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -alertView.bounds.width / 2 ),
                                    stackView.bottomAnchor.constraint(equalTo: alertView.bottomAnchor, constant: -15)])
    
    let yesButton = UIButton()
    //        yesButton.backgroundColor = .red
    yesButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    
    yesButton.setTitle("Continue", for: .normal)
    yesButton.setTitleColor(.black, for: .normal)
    yesButton.frame = CGRect(x: 0, y: 0, width: stackView.bounds.width, height: stackView.bounds.height)
    yesButton.titleLabel?.font = UIFont(name:"GeezaPro-Blod", size: 16.0)
    stackView.addArrangedSubview(yesButton)
    
    
    let noButton = UIButton()
    noButton.addTarget(self, action: #selector(noAction), for: .touchUpInside)
    
    noButton.setTitle("Start over", for: .normal)
    noButton.setTitleColor(.black, for: .normal)
    noButton.titleLabel?.font = UIFont(name:"GeezaPro-Blod", size: 16.0)
    stackView.addArrangedSubview(noButton)
    
    
    let messageAlert = UILabel()
    messageAlert.text = "Do you want to continue or start over?"
    messageAlert.numberOfLines = 0
    messageAlert.textColor = .black
    messageAlert.textAlignment = .center
    messageAlert.font = UIFont(name:"GeezaPro", size: 16.0)
    
    alertView.addSubview(messageAlert)
    
    messageAlert.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
                                    messageAlert.topAnchor.constraint(equalTo: titelAlert.topAnchor, constant: 50),
                                    messageAlert.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 30 ),
                                    messageAlert.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -30 ),
                                    messageAlert.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: 0)])
    
    
    
    // Do any additional setup after loading the view.
  }
  
  
  
  @objc func noAction(){
    UserDefaults.standard.set(0, forKey: "qusetionNumber")
    performSegue(withIdentifier: "passToQuestionView", sender: self)
    UserDefaults.standard.set(0, forKey: "correctAnswer")
    UserDefaults.standard.set(0, forKey: "score")
    
  }
  
  @objc func buttonAction() {
    performSegue(withIdentifier: "passToQuestionView", sender: self)
  }
  
}
