//
//  CatFactDependencyProvider.swift
//  CatFacts
//
//  Created by Deepesh Vasthimal on 21/12/2023.
//

import Foundation

enum Constants {
    static let scheme = "https"
    static let host = "api.npoint.io"
    static let path = "/18962a8a5d00e62a8d2a"
}

// Todo : may be use a facade pattern : https://betterprogramming.pub/ios-architectures-explained-which-one-best-fits-my-project-94b4ffaad16


class CatFactDependencyProvider {
    
    var apiConfig = APIConfig(scheme: Constants.scheme,
                              host: Constants.host,
                              path: Constants.path)

    var apiFetcher: NetworkProtocol {
        return NetworkManager(urlSession: URLSession.shared)
    }
    
    var customDecoder = CustomDecoder()
    
    var factAPIService: FactsAPIProtocol {
        return FactsAPI(apiConfig: self.apiConfig, 
                        apiFetcher: self.apiFetcher,
                        jsonDecoder: self.customDecoder)
    }

    var viewModel: CatFactViewModel {
        return CatFactViewModel(factService: self.factAPIService)
    }
    
    var catFactViewController: CatFactViewController {
        return CatFactViewController(catFactViewModel: self.viewModel)
    }
    
}
