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
    
    
    let viewController = PrimeViewController()
    
    func testRandomNumber() {
        
        // Given a maximum number of 33
        // When the randomNumberGenerator is called
        // A random number below 33 is genereted
        
        let maximum = 33
        let result = viewController.generateRandomInt(below: maximum)
        XCTAssertEqual(result,3)
        
    }
    
   
    
}
