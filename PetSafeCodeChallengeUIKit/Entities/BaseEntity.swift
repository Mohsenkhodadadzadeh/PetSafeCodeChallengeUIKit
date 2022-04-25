//
//  BaseEntity.swift
//  PetSafeCodeChallengeUIKit
//
//  Created by Mohsen on 4/25/22.
//

import Foundation

struct BaseEntity: GenericEntity {
        
    var success: Bool?
    
    let historical: Bool?
    
    let timestamp: Int?
    
    private let _base: String?
    
    var base: SymbolsEnums {
        if let _base = _base {
            return SymbolsEnums(rawValue: _base) ?? .Undefined
        }
        return .Undefined
    }
    
    private let _date: String?
    
    var date: Date {
        return _date?.convertToDate() ?? Date()
    }
    
    let rates: RatesEntity?
    
    var error: ErrorEntity?
    
    enum CodingKeys: String, CodingKey {
        
        case success
        
        case historical
        
        case timestamp
        
        case _base = "base"
        
        case _date = "date"
        
        case rates
        
        case error
        
    }
}
