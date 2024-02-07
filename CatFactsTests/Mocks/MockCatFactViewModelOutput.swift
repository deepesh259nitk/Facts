//
//  MockCatFactViewModelOutput.swift
//  CatFactsTests
//
//  Created by Deepesh Vasthimal on 21/12/2023.
//

@testable import CatFacts

class MockCatFactViewModelOutput: CatFactViewModelOutput {
    
    var updateViewArray: [CatFact] = []
    var updateError: NetworkError!
    
    func updateView(with catFacts: [CatFact]) {
        updateViewArray = catFacts
    }
    
    func updateView(with error: Error) {
        updateError = error as? NetworkError
    }

}
