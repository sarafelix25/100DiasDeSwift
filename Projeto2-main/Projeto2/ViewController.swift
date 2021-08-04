//
//  ViewController.swift
//  Projeto2
//
//  Created by sara.batista.d.felix on 13/07/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var askedQuestions = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
            
        countries += ["estonia", "france", "germany",
                      "ireland", "italy", "monaco",
                      "nigeria", "poland", "russia",
                      "spain", "uk", "us"]
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "SCORE", style: .plain, target: self, action: #selector(getScore))
        
        askQuestion()
        startNewGame(action: nil)
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named:countries[0]), for: .normal)
        button2.setImage(UIImage(named:countries[1]), for: .normal)
        button3.setImage(UIImage(named:countries[2]), for: .normal)
        
        let uppercasedCountry = countries[correctAnswer].uppercased()
        title = "Tap on \(uppercasedCountry)'s flag"
    
    }
    
    func startNewGame(action: UIAlertAction! = nil) {
        score = 0
        askedQuestions = 0
        
        askQuestion()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String

        if sender.tag == correctAnswer {
            title = "CORRECT"
            score += 1
        } else {
            title = "WRONG. That's the flag of \(countries[sender.tag].uppercased())!"
            score -= 1
        }
        
        if askedQuestions <= 10 {
            let ac = UIAlertController(title: title, message: nil, preferredStyle: .alert)
           ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
           present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: title, message: "Your final score is \(score)", preferredStyle: .alert)
          ac.addAction(UIAlertAction(title: "Play again", style: .default, handler: askQuestion))
          present(ac, animated: true)
          score = 0
        }
    }
    
    @objc func getScore() {
        let scoreAlert = UIAlertController(title: "SCORE", message: "Your score is \(score)", preferredStyle: .alert)
        scoreAlert.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
        
        present(scoreAlert, animated: true)
    }
}

