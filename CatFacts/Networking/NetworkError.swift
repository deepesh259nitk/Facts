//
//  NetworkError.swift
//  CatFacts
//
//  Created by Deepesh Vasthimal on 19/12/2023.
//

import Foundation

enum NetworkError: Error {
    case invalidResponse
    case invalidData
    case errorDecodingData
    case unableToCompleteRequest
    case invalidURL
}

extension NetworkError: CustomStringConvertible {
    public var description: String {
        switch self {
        case .invalidResponse:
            return NSLocalizedString("invalidResponse", comment: "")
        case .invalidData:
            return NSLocalizedString("invalidData", comment: "")
        case .errorDecodingData:
            return NSLocalizedString("errorDecodingData", comment: "")
        case .unableToCompleteRequest:
            return NSLocalizedString("unableToCompleteRequest", comment: "")
        case .invalidURL:
            return NSLocalizedString("invalidURL", comment: "")
        }
    }
}
