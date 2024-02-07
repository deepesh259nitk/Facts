//
//  CatFactViewModelTests.swift
//  CatFactsTests
//
//  Created by Deepesh Vasthimal on 20/12/2023.
//

import XCTest
@testable import CatFacts

final class CatFactViewModelTests: XCTestCase {
    
    private var viewModel: CatFactViewModel!
    private var factsAPIService: MockFactsAPIService!
    private var viewModelOutput: MockCatFactViewModelOutput!
    private var dateFormatter: DateFormatter!
    private var createdDate: Date! = nil
    
    override func setUp() {
        super.setUp()
        
        factsAPIService = MockFactsAPIService()
        viewModel = CatFactViewModel(factService: factsAPIService)
        viewModelOutput = MockCatFactViewModelOutput()
        viewModel.delegate = viewModelOutput
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        createdDate = dateFormatter.date(from: "2023/10/08 22:31")
    }
     
    func testUpdateView_OnAPISuccess_ShowsFactAndIcons() {
        
        // given
        let status = Status(verified: true, sentCount: 1)
        let catFact = CatFact(status: status, 
                              text: "I am the oldest cat",
                              createdAt: createdDate)
        factsAPIService.fetchMockCatFactResult = .success([catFact])
        
        // when
        viewModel.fetchCatFact()
        
        // then
        XCTAssertEqual(viewModelOutput.updateViewArray.count, 1)
        XCTAssertEqual(viewModelOutput.updateViewArray[0].text, "I am the oldest cat")
        XCTAssertEqual(viewModelOutput.updateViewArray[0].status.verified, true)
        XCTAssertEqual(viewModelOutput.updateViewArray[0].status.sentCount, 1)
        XCTAssertEqual(viewModelOutput.updateViewArray[0].createdAt, dateFormatter.date(from: "2023/10/08 22:31"))
        
        XCTAssertNil(viewModelOutput.updateError)
        
    }
    
    func testUpdateView_OnAPIFailure_ShowsError() {
        // given
        factsAPIService.fetchMockCatFactResult = .failure(NetworkError.errorDecodingData)
        
        // when
        viewModel.fetchCatFact()
        
        // then
        XCTAssertEqual(viewModelOutput.updateViewArray.count, 0)
        XCTAssertNotNil(viewModelOutput.updateError)
        XCTAssertEqual(viewModelOutput.updateError, .errorDecodingData)
        XCTAssertEqual(viewModelOutput.updateError.description, "There was some error while decoding data from server. Please try later.")
        
    }
    
    func testUpdateView_OnAPIFailure_WithInvalidData() {
        // given
        factsAPIService.fetchMockCatFactResult = .failure(NetworkError.invalidData)
        
        // when
        viewModel.fetchCatFact()
        
        // then
        XCTAssertEqual(viewModelOutput.updateViewArray.count, 0)
        XCTAssertNotNil(viewModelOutput.updateError)
        XCTAssertEqual(viewModelOutput.updateError, .invalidData)
        XCTAssertEqual(viewModelOutput.updateError.description, "Data from the server is invalid or empty. Please try later.")
        
    }
    
    func testUpdateView_OnAPIFailure_WithInvalidResponse() {
        // given
        factsAPIService.fetchMockCatFactResult = .failure(NetworkError.invalidResponse)
        
        // when
        viewModel.fetchCatFact()
        
        // then
        XCTAssertEqual(viewModelOutput.updateViewArray.count, 0)
        XCTAssertNotNil(viewModelOutput.updateError)
        XCTAssertEqual(viewModelOutput.updateError, .invalidResponse)
        XCTAssertEqual(viewModelOutput.updateError.description, "Response from the server is not valid. Please try later.")
        
    }
    
    func testUpdateView_OnAPIFailure_WithInvalidUrl() {
        // given
        factsAPIService.fetchMockCatFactResult = .failure(NetworkError.invalidURL)
        
        // when
        viewModel.fetchCatFact()
        
        // then
        XCTAssertEqual(viewModelOutput.updateViewArray.count, 0)
        XCTAssertNotNil(viewModelOutput.updateError)
        XCTAssertEqual(viewModelOutput.updateError, .invalidURL)
        XCTAssertEqual(viewModelOutput.updateError.description, "The server url is not valid. Please try later")
        
    }
    
    func testUpdateView_OnAPIFailure_UnableToCompleteRequest() {
        // given
        factsAPIService.fetchMockCatFactResult = .failure(NetworkError.unableToCompleteRequest)
        
        // when
        viewModel.fetchCatFact()
        
        // then
        XCTAssertEqual(viewModelOutput.updateViewArray.count, 0)
        XCTAssertNotNil(viewModelOutput.updateError)
        XCTAssertEqual(viewModelOutput.updateError, .unableToCompleteRequest)
        XCTAssertEqual(viewModelOutput.updateError.description, "Unable to complete your request. Please check your internet connection.")
        
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
        factsAPIService = nil
        viewModelOutput = nil
        dateFormatter = nil
        createdDate = nil
        try super.tearDownWithError()
    }
}




