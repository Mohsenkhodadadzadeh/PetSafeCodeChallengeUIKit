//
//  TimeSeriesEntity.swift
//  PetSafeCodeChallengeUIKit
//
//  Created by Mohsen on 4/25/22.
//

import Foundation

struct TimeSeriesEntity: GenericEntity {
    
    var success: Bool?
    
    let timeseries: Bool?
    
    private let start_date: String?
    
    var startDate: Date? {
        return start_date?.convertToDate()
    }
    
    private let end_date: String?
    
    var endDate: Date? {
        return end_date?.convertToDate()
    }
    
    private let _base: String?
    
    var base: SymbolsEnums? {
        if let _base = _base {
            return SymbolsEnums(rawValue: _base)
        }
        return nil
    }
    
    let rates: TimeSeriesRatesEntity?
    
    var error: ErrorEntity?
    
    enum CodingKeys: String, CodingKey {
        case success
        case timeseries
        case start_date
        case end_date
        case _base = "base"
        case rates
        case error
    }
    
}
