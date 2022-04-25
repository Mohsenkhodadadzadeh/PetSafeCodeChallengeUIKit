//
//  SymbolsEnums.swift
//  PetSafeCodeChallengeUIKit
//
//  Created by Mohsen on 4/25/22.
//

import Foundation

enum SymbolsEnums: String {
    
    case USD
    
    case EUR
    
    case JPY
    
    case GBP
    
    case AUD
    
    case CAD
    
    case CHF
    
    case CNY
    
    case SEK
    
    case NZD
    
    case Undefined
    static func fetchAll() -> [SymbolsEnums] {
        return [.USD, .EUR, .JPY, .GBP, .AUD, .CAD, .CHF, .CNY, .SEK, .NZD]
    }
}
