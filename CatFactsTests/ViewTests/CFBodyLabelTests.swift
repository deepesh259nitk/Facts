//
//  CFBodyLabelTests.swift
//  CatFactsTests
//
//  Created by Deepesh Vasthimal on 21/12/2023.
//

import XCTest
@testable import CatFacts

final class CFBodyLabelTests: XCTestCase {

    private var customBodyLabel: CFBodyLabel!

    func testCFButton_Initialised_WithFrame() {
        customBodyLabel = CFBodyLabel(frame: CGRect(x: 20, y: 20, width: 200, height: 45))
        XCTAssertEqual(customBodyLabel.frame.width, 200)
        XCTAssertEqual(customBodyLabel.frame.height, 45)
        XCTAssertEqual(customBodyLabel.frame.minX, 20)
        XCTAssertEqual(customBodyLabel.frame.minY, 20)
        
        XCTAssertEqual(customBodyLabel.textAlignment.rawValue, 4)
        XCTAssertEqual(customBodyLabel.textColor, .label)
        XCTAssertEqual(customBodyLabel.adjustsFontSizeToFitWidth, true)
        XCTAssertEqual(customBodyLabel.minimumScaleFactor, 0.8999999761581421)
        XCTAssertEqual(customBodyLabel.lineBreakMode, .byWordWrapping)
        XCTAssertEqual(customBodyLabel.numberOfLines, 0)
        XCTAssertEqual(customBodyLabel.translatesAutoresizingMaskIntoConstraints, false)
                       
    }
}
