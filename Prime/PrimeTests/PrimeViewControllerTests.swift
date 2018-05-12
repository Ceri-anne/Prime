//
//  ViewControllerTests.swift
//  PrimeTests
//
//  Created by Jackson, Ceri-anne (Associate Software Developer) on 12/05/2018.
//  Copyright © 2018 Jackson, Ceri-anne. All rights reserved.
//
@testable import Prime
import XCTest

class ViewControllerTests: XCTestCase {
    
    var viewController: PrimeViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        viewController = storyboard.instantiateInitialViewController() as! PrimeViewController
        viewController.loadView()
    }
    
    func testRandomNumber() {
        
        // Given a maximum number of 33
        // When the randomNumberGenerator is called
        // A random number below 33 is genereted
        
        let maximum = 33
        let result = viewController.generateRandomInt(below: maximum)
        XCTAssertTrue(result > 0)
        XCTAssertTrue(result <= 33)
        
    }
    
    func testIsPrimeWithPrime() {
    
        // Given a prime number
        // When isPrime is called
        // The result is true
    
        let number = 13
        let result = viewController.isPrime(number)
        XCTAssertTrue(result)
    
    }
    
    func testIsPrimeWithNonPrime() {
        
        // Given a prime number
        // When isPrime is called
        // The result is true
        
        let number = 9
        let result = viewController.isPrime(number)
        XCTAssertFalse(result)
        
    }
    
    func testCheckAnswerWithPrimeIncorrect() {
        
        // Given a prime number is displayed
        // When "No" is chosen
        // Check Answer sets the correct answer and colour for resultLabel

        viewController.checkAnswer("NO", actual: 13)
        
        XCTAssertEqual(viewController.resultLabel.text, "Incorrect 13 is Prime")
        XCTAssertEqual(viewController.resultLabel.textColor, .red)

    }
    
    func testCheckAnswerWithPrimeCorrect() {
        
        // Given a prime number is displayed
        // When "No" is chosen
        // Check Answer sets the correct answer and colour for resultLabel
        
        viewController.checkAnswer("YES", actual: 13)
        
        XCTAssertEqual(viewController.resultLabel.text, "Correct 13 is Prime")
        XCTAssertEqual(viewController.resultLabel.textColor, .green)

    }
    
    func testCheckAnswerWithNonPrimeCorrect() {
        
        // Given a prime number is displayed
        // When "No" is chosen
        // Check Answer sets the correct answer and colour for resultLabel
        
        viewController.checkAnswer("NO", actual: 4)
        
        XCTAssertEqual(viewController.resultLabel.text, "Correct 4 is not Prime")
        XCTAssertEqual(viewController.resultLabel.textColor, .green)

    }
    
    func testCheckAnswerWithNonPrimeIncorrect() {
        
        // Given a prime number is displayed
        // When "No" is chosen
        // Check Answer sets the correct answer and colour for resultLabel
        
        viewController.checkAnswer("YES", actual: 4)
        
        XCTAssertEqual(viewController.resultLabel.text, "Incorrect 4 is not Prime")
        XCTAssertEqual(viewController.resultLabel.textColor, .red)
        
    }
    
    func testStartGame() {
        
        // When the game is started
        // The numberLabel is populated correctly
        
        viewController.startGame()
        XCTAssertEqual(viewController.numberLabel.text, String(viewController.number))
    }
    
}
