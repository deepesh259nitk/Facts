//
//  CFImageViewTests.swift
//  CatFactsTests
//
//  Created by Deepesh Vasthimal on 21/12/2023.
//

import XCTest
@testable import CatFacts

final class CFImageViewTests: XCTestCase {

    private var customImageView: CFImageView!

    func testCFButton_Initialised_WithFrame() {
        customImageView = CFImageView(frame: CGRect(x: 20, y: 20, width: 200, height: 45))
        XCTAssertEqual(customImageView.frame.width, 200)
        XCTAssertEqual(customImageView.frame.height, 45)
        XCTAssertEqual(customImageView.frame.minX, 20)
        XCTAssertEqual(customImageView.frame.minY, 20)
        
        XCTAssertEqual(customImageView.layer.cornerRadius, 10.0)
        XCTAssertEqual(customImageView.clipsToBounds, true)
        XCTAssertEqual(customImageView.isAccessibilityElement, true)
        XCTAssertEqual(customImageView.translatesAutoresizingMaskIntoConstraints, false)
                       
    }

}
