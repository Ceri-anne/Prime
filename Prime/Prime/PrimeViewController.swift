//
//  PrimeViewController.swift
//  Prime
//
//  Created by Jackson, Ceri-anne (Associate Software Developer) on 12/05/2018.
//  Copyright © 2018 Jackson, Ceri-anne. All rights reserved.
//

import UIKit

class PrimeViewController: UIViewController {

    @IBOutlet weak var number: UILabel!
    
    @IBAction func buttonPressed(_ sender: Any) {
        print("Button pressed")
    }
    
    let primes = [2,3,5,7,11,13,17,19]
    let maximum = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        number.text = String(generateRandomInt(below: maximum))
    }

    func generateRandomInt(below maximum: Int) -> Int {
        return 3
    }
}


