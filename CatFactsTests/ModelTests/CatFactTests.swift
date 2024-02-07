//
//  CatFactTests.swift
//  CatFactsTests
//
//  Created by Deepesh Vasthimal on 21/12/2023.
//

import XCTest
@testable import CatFacts

final class CatFactTests: XCTestCase {

    private var dateFormatter: DateFormatter!
    private var createdDate: Date! = nil
    
    override func setUp() {
        super.setUp()
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        createdDate = dateFormatter.date(from: "2023/10/08 22:31")
    }
    
    func loadDummyData() -> [CatFact] {
        let status = Status(verified: true, sentCount: 1)
        let catFact1 = CatFact(status: status, text: "I am fact 1 polar bear Nisi", createdAt: Date())
        let catFact2 = CatFact(status: status, text: "I am fact 2 lion", createdAt: Date())
        let catFact3 = CatFact(status: status, text: "I am fact 3 Tiger", createdAt: Date())
        let catFact4 = CatFact(status: status, text: "I am fact 4 Elephant", createdAt: Date())
        let catFacts = [catFact1, catFact2, catFact3, catFact4]
       return catFacts
    }
    
    func testIsNewFact() {
        let status = Status(verified: true, sentCount: 1)
        let todaysDate = dateFormatter.date(from: "2023/10/20 22:31")!
        let catFact = CatFact(status: status, text: "I am the oldest cat",
                              createdAt: createdDate)
        XCTAssertTrue(catFact.isNewFact(today: todaysDate))
    }
    
    func testIsFactVerified() {
        let status = Status(verified: true, sentCount: 1)
        let catFact = CatFact(status: status,
                              text: "I am the oldest cat",
                              createdAt: createdDate)
        XCTAssertTrue(catFact.isFactVerified())
    }
    
    func testFilter() {
        let catFacts = loadDummyData()
        XCTAssertEqual(CatFact.filter(in: catFacts, with: "Ni").count, 1)
        XCTAssertEqual(CatFact.filter(in: catFacts, with: "p").count, 2)
        XCTAssertEqual(CatFact.filter(in: catFacts, with: "fact").count, 4)
        XCTAssertEqual(CatFact.filter(in: catFacts, with: "z").count, 0)
        XCTAssertEqual(CatFact.filter(in: catFacts, with: "Elephant").count, 1)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        dateFormatter = nil
        createdDate = nil
    }
}
