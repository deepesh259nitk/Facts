//
//  Date+Ext.swift
//  CatFacts
//
//  Created by Deepesh Vasthimal on 20/12/2023.
//

import Foundation
extension Date {
    func days(endDate: Date) -> Int? {
        return Calendar.current.dateComponents([.day], from: self, to: endDate).day
    }
}
