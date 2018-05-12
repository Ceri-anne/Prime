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
        checkAnswer(answer!, actual: number)
    }
    
    let primes = [2,3,5,7,11,13,17,19]
    let maximum = 20
    var number: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startGame()
    }

    func generateRandomInt(below maximum: Int) -> Int {
        // Do not return zero
        let max = UInt32(maximum - 1)
        let random = arc4random_uniform(max) + 1
        return Int(random)
    }
    
    func isPrime(_ number: Int) -> Bool {
        return primes.contains(number)
    }
    
    func startGame() {
        number = generateRandomInt(below: maximum)
        numberLabel.text = String(number)
    }
    
    func checkAnswer(_ answer: String, actual: Int) {
        let choiceIsPrime = answer == "YES"
        let numberIsPrime = isPrime(actual)
        
        switch (choiceIsPrime, numberIsPrime) {
        case (true,true):
            resultLabel.text = "Correct \(actual) is Prime"
            resultLabel.textColor = .green
        case (true,false):
            resultLabel.text = "Incorrect \(actual) is not Prime"
            resultLabel.textColor = .red
        case (false,false):
            resultLabel.text = "Correct \(actual) is not Prime"
            resultLabel.textColor = .green
        case (false,true):
            print(actual)
            resultLabel.text = "Incorrect \(actual) is Prime"
            resultLabel.textColor = .red
        }
        
        startGame()
    }
}
