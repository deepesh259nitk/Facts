//
//  CatFactDependencyProviderTests.swift
//  CatFactsTests
//
//  Created by Deepesh Vasthimal on 21/12/2023.
//

import XCTest
@testable import CatFacts

final class CatFactDependencyProviderTests: XCTestCase {

    private let catFactDependencyProvider = CatFactDependencyProvider()
    
    func testCatFactDependencyProvider() {
        
        XCTAssertEqual(catFactDependencyProvider.apiConfig.scheme, "https")
        XCTAssertEqual(catFactDependencyProvider.apiConfig.host, "api.npoint.io")
        XCTAssertEqual(catFactDependencyProvider.apiConfig.path, "/18962a8a5d00e62a8d2a")
        
        XCTAssertNotNil(catFactDependencyProvider.apiFetcher)
        XCTAssertNotNil(catFactDependencyProvider.customDecoder)
    
        XCTAssertNotNil(catFactDependencyProvider.factAPIService)
        
        XCTAssertNotNil(catFactDependencyProvider.viewModel)
        XCTAssertNotNil(catFactDependencyProvider.catFactViewController)
        
    }

}
