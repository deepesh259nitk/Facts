//
//  CustomAlertViewControllerTests.swift
//  CatFactsTests
//
//  Created by Deepesh Vasthimal on 21/12/2023.
//

import XCTest
@testable import CatFacts

final class CustomAlertViewControllerTests: XCTestCase {

    private var customAlertVC: CustomAlertViewController!

    // Todo: Do we really need this test ? 
    func testCFButton_Initialised_title_message() {
       
        customAlertVC = CustomAlertViewController(title: "I am super Alert", message: "Awesome message", buttonTitle: "Ok")
        
        XCTAssertEqual(customAlertVC.message, "Awesome message")
        XCTAssertEqual(customAlertVC.alertTitle, "I am super Alert")
        XCTAssertEqual(customAlertVC.buttonTitle, "Ok")
        
        XCTAssertEqual(customAlertVC.titleLabel.textAlignment, .center)
        XCTAssertEqual(customAlertVC.titleLabel.font, UIFont.systemFont(ofSize: 20, weight: .bold))

    }
}
