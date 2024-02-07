//
//  CatFact.swift
//  CatFacts
//
//  Created by Deepesh Vasthimal on 19/12/2023.
//

import Foundation

struct CatFact: Decodable, Hashable {
    
    let status: Status
    let text: String
    let createdAt: Date
    
    func isNewFact(today: Date = Date()) -> Bool {
        guard let days = createdAt.days(endDate: today),
              days <= 90, days > 0 else {
            return false
        }
     
        return true
    }
    
    func isFactVerified() -> Bool {
        return status.verified
    }
    
    static func filter(in catFacts: [CatFact], with searchText: String) -> [CatFact] {
        return catFacts.filter({ $0.text.lowercased().contains(searchText.lowercased())} )
    }
}

struct Status: Decodable, Hashable {
    let verified: Bool
    let sentCount: Int
}

