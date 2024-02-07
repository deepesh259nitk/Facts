//
//  FactsAPI.swift
//  CatFacts
//
//  Created by Deepesh Vasthimal on 19/12/2023.
//

import Foundation

protocol FactsAPIProtocol {
    func getFacts(completion: @escaping (Result<[CatFact], Error>) -> Void)
}

class FactsAPI: FactsAPIProtocol {
    
    private let apiConfig: APIConfig
    private let apiFetcher: NetworkProtocol
    private let jsonDecoder: JSONDecoder
    
    init(apiConfig: APIConfig, 
         apiFetcher: NetworkProtocol,
         jsonDecoder: JSONDecoder) {
        self.apiConfig = apiConfig
        self.apiFetcher = apiFetcher
        self.jsonDecoder = jsonDecoder
        
    }
    
    func getFacts(completion: @escaping (Result<[CatFact], Error>) -> Void) {
        
        var components = URLComponents()
        components.scheme = apiConfig.scheme
        components.host = apiConfig.host
        components.path = apiConfig.path
        
        guard let url = components.url else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = HTTPMethod.GET.rawValue
        
        apiFetcher.fetch(urlRequest: urlRequest, decoder: jsonDecoder, completion: { result in
            completion(result)
        })
    }
}
