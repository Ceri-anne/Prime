//
//  PrimeViewController.swift
//  Prime
//
//  Created by Jackson, Ceri-anne (Associate Software Developer) on 12/05/2018.
//  Copyright © 2018 Jackson, Ceri-anne. All rights reserved.
//

import UIKit

class PrimeViewController: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBAction func buttonPressed(_ sender: UIButton) {
        let answer = sender.titleLabel?.text
        checkAnswer(answer!)
    }
    
    let primes = [2,3,5,7,11,13,17,19]
    let maximum = 20
    var number: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        number = generateRandomInt(below: maximum)
        numberLabel.text = String(number)
    }

    func generateRandomInt(below maximum: Int) -> Int {
        return 3
    }
    
    func isPrime(_ number: Int) -> Bool {
        return primes.contains(number)
    }
    
    func checkAnswer(_ answer: String) {
        let choiceIsPrime = answer == "YES"
        let numberIsPrime = isPrime(number)
        if choiceIsPrime == numberIsPrime {
            resultLabel.text = "Correct"
            resultLabel.textColor = .green
        } else {
            resultLabel.text = "Incorrect"
            resultLabel.textColor = .red
        }
    }
}
