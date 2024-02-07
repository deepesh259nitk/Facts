//
//  CatFactViewModel.swift
//  CatFacts
//
//  Created by Deepesh Vasthimal on 19/12/2023.
//

import Foundation

protocol CatFactViewModelOutput: AnyObject {
    func updateView(with catFacts: [CatFact])
    func updateView(with error: Error)
}

class CatFactViewModel {
    
    weak var delegate: CatFactViewModelOutput?
    let factService: FactsAPIProtocol
    
    init(factService: FactsAPIProtocol) {
        self.factService = factService
    }
    
    func fetchCatFact() {
        factService.getFacts { [weak self] result in
            guard let self = self else {
                return
            }
            
            switch result {
            case .success(let catFacts):
                self.delegate?.updateView(with: catFacts)
                
            case .failure(let error):
                self.delegate?.updateView(with: error)
            }
        }
    }

}

