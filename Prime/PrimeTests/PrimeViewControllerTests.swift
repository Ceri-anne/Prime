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
    
    func testScoreAtStart() {
        
        // When the app loads
        // Then score is zero
        
        XCTAssertEqual(viewController.scoreLabel.text, "0")
    }
    
    
    func testUpdateScore() {
       
        // Given the current score is 567
        // When the score is updated
        // Then the score is set to 568
        
        viewController.score = 567
        viewController.updateScore()
        XCTAssertEqual(viewController.score, 568)
        XCTAssertEqual(viewController.scoreLabel.text, "568")

    }
    
    func testResetScore() {
        
        // Given the current score is 53
        // When reset score is called
        // Then the score is set to zero
        
        viewController.scoreLabel.text = "53"
        viewController.resetScore()
        XCTAssertEqual(viewController.scoreLabel.text, "0")
    }
    
    func testResetScoreWithHighScore() {
        
        // Given the current score is 53
        // And the high score is 20
        // When reset score is called
        // Then the score is set to zero
        // And the high score is set to 53
        
        viewController.score = 53
        viewController.scoreLabel.text = "53"
        viewController.highScore = 20
        viewController.highScoreLabel.text = "20"

        viewController.resetScore()
        XCTAssertEqual(viewController.score, 0)
        XCTAssertEqual(viewController.scoreLabel.text, "0")
        XCTAssertEqual(viewController.highScore, 53)
        XCTAssertEqual(viewController.highScoreLabel.text, "53")
    }
    
    func testResetScoreWithLowScore() {
        
        // Given the current score is 3
        // And the high score is 20
        // When reset score is called
        // Then the score is set to zero
        // And the high score stays at 20
        
        viewController.score = 3
        viewController.scoreLabel.text = "3"
        viewController.highScore = 20
        viewController.highScoreLabel.text = "20"

        viewController.resetScore()
        XCTAssertEqual(viewController.score, 0)
        XCTAssertEqual(viewController.scoreLabel.text, "0")
        XCTAssertEqual(viewController.highScore, 20)
        XCTAssertEqual(viewController.highScoreLabel.text, "20")
       
    }
    
}
