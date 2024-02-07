//
//  CFButtonTests.swift
//  CatFactsTests
//
//  Created by Deepesh Vasthimal on 21/12/2023.
//

import XCTest
@testable import CatFacts

final class CFButtonTests: XCTestCase {

    private var customButton: CFButton!

    func testCFButton_Initialised_WithFrame() {
        customButton = CFButton(frame: CGRect(x: 20, y: 20, width: 200, height: 45))
        XCTAssertEqual(customButton.frame.width, 200)
        XCTAssertEqual(customButton.frame.height, 45)
        XCTAssertEqual(customButton.frame.minX, 20)
        XCTAssertEqual(customButton.frame.minY, 20)
        
        XCTAssertEqual(customButton.backgroundColor, nil)
        XCTAssertEqual(customButton.layer.cornerRadius, 10)
        XCTAssertEqual(customButton.titleLabel?.font, UIFont.preferredFont(forTextStyle: .headline))
    }
    
    func testCFButton_Initialised_BackgroundColor_Title() {
        customButton = CFButton(backgroundColor: .systemRed, title: "Super Button")
        XCTAssertEqual(customButton.frame.width, 0)
        XCTAssertEqual(customButton.frame.height, 0)
        XCTAssertEqual(customButton.frame.minX, 0)
        XCTAssertEqual(customButton.frame.minY, 0)
        
        XCTAssertEqual(customButton.backgroundColor, .systemRed)
        XCTAssertEqual(customButton.layer.cornerRadius, 10)
        XCTAssertEqual(customButton.titleLabel?.font, UIFont.preferredFont(forTextStyle: .headline))
    }

}
