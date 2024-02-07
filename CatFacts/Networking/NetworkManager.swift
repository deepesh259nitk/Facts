//
//  NetworkManager.swift
//  CatFacts
//
//  Created by Deepesh Vasthimal on 19/12/2023.
//

import Foundation

protocol NetworkProtocol {
    func fetch<T: Decodable>(urlRequest: URLRequest,
                             decoder: JSONDecoder,
                             completion: @escaping(Result<T, Error>) -> Void)
}

class NetworkManager: NetworkProtocol {
    
    private var urlSession: URLSession
    
    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }
    
    func fetch<T>(urlRequest: URLRequest,
                  decoder: JSONDecoder,
                  completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        
        let task = urlSession.dataTask(with: urlRequest) { data, response, error in
                        
            if let _ = error {
                completion(.failure(NetworkError.unableToCompleteRequest))
                return
            }
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                completion(.failure(NetworkError.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.invalidData))
                return
            }
            
            do {
                let object = try decoder.decode(T.self, from: data)
                completion(.success(object))
                return
            } catch {
                completion(.failure(NetworkError.errorDecodingData))
            }
    }
        task.resume()
    }

}
