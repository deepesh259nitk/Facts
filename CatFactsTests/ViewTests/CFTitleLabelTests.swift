//
//  CFTitleLabelTests.swift
//  CatFactsTests
//
//  Created by Deepesh Vasthimal on 21/12/2023.
//

import XCTest
@testable import CatFacts

final class CFTitleLabelTests: XCTestCase {

    private var customTitleLabel: CFTitleLabel!

    func testCFButton_Initialised_WithFrame() {
       
        customTitleLabel = CFTitleLabel(frame: CGRect(x: 20, y: 20, width: 200, height: 45))
        XCTAssertEqual(customTitleLabel.frame.width, 200)
        XCTAssertEqual(customTitleLabel.frame.height, 45)
        XCTAssertEqual(customTitleLabel.frame.minX, 20)
        XCTAssertEqual(customTitleLabel.frame.minY, 20)
        
        //XCTAssertEqual(customTitleLabel.font, .)
        XCTAssertEqual(customTitleLabel.textColor, .label)
        XCTAssertEqual(customTitleLabel.lineBreakMode, .byTruncatingTail)
        XCTAssertEqual(customTitleLabel.minimumScaleFactor, 0.8999999761581421)
        XCTAssertEqual(customTitleLabel.adjustsFontSizeToFitWidth, true)
        
    }
    
    func testCFButton_Initialised_BackgroundColor_Title() {
        customTitleLabel = CFTitleLabel(textAlignment: .center, fontSize: 15.0)
        XCTAssertEqual(customTitleLabel.frame.width, 0)
        XCTAssertEqual(customTitleLabel.frame.height, 0)
        XCTAssertEqual(customTitleLabel.frame.minX, 0)
        XCTAssertEqual(customTitleLabel.frame.minY, 0)
        
        XCTAssertEqual(customTitleLabel.font, UIFont.systemFont(ofSize: 15, weight: .bold))
        XCTAssertEqual(customTitleLabel.textColor, .label)
        XCTAssertEqual(customTitleLabel.lineBreakMode, .byTruncatingTail)
        XCTAssertEqual(customTitleLabel.minimumScaleFactor, 0.8999999761581421)
        XCTAssertEqual(customTitleLabel.adjustsFontSizeToFitWidth, true)
    }

}
