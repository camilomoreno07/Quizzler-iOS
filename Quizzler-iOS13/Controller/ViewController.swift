//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var choiceOne: UIButton!
    @IBOutlet weak var choiceTwo: UIButton!
    @IBOutlet weak var choiceThree: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
    
        let userAnswer = sender.currentTitle!
        let check = quizBrain.checkAnswer(userAnswer)
       
        if check {
            sender.backgroundColor = UIColor.green
        }
        else{
            sender.backgroundColor = UIColor.red
        }
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
       
    }
    
    @objc func updateUI() {
        changeAtributesButtons()
        questionLabel.text = quizBrain.updatingQuestion()
        scoreLabel.text = "Score: \(quizBrain.questionNumber)"
        progressBar.progress = Float(quizBrain.questionNumber + 1)/Float(quizBrain.quiz.count)
      
    }
    
    func changeAtributesButtons() {
        let answers = quizBrain.updatingAnswer()
        choiceOne.setTitle(answers[0], for: .normal)
        choiceTwo.setTitle(answers[1], for: .normal)
        choiceThree.setTitle(answers[2], for: .normal)
        choiceOne.backgroundColor = UIColor.clear
        choiceTwo.backgroundColor = UIColor.clear
        choiceThree.backgroundColor = UIColor.clear
    }
    

    
}

