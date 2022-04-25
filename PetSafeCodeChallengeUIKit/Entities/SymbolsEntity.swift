//
//  SymbolsEntity.swift
//  PetSafeCodeChallengeUIKit
//
//  Created by Mohsen on 4/25/22.
//

import Foundation

struct SymbolsEntity: GenericEntity {
   
    var success: Bool?
    
    let symbols: [String: String]?
    
    var error: ErrorEntity?
    
}
