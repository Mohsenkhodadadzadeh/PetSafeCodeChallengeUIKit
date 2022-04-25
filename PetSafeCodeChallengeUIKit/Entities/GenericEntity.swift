//
//  GenericEntity.swift
//  PetSafeCodeChallengeUIKit
//
//  Created by Mohsen on 4/25/22.
//

import Foundation

protocol GenericEntity: Codable {
    
    var success: Bool? { get set }
    
    var error: ErrorEntity? { get set }
    
}
