//
//  MockFactsAPIService.swift
//  CatFactsTests
//
//  Created by Deepesh Vasthimal on 21/12/2023.
//

@testable import CatFacts

class MockFactsAPIService: FactsAPIProtocol {
    
    var fetchMockCatFactResult: Result<[CatFact], Error>?
    
    func getFacts(completion: @escaping (Result<[CatFacts.CatFact], Error>) -> Void) {
        if let result = fetchMockCatFactResult {
            completion(result)
        }
    }
}
