//
//  NetworkChainProtocol.swift
//  PetSafeCodeChallengeUIKit
//
//  Created by Mohsen on 4/25/22.
//

import Foundation

protocol NetworkChainProtocol {
    
    var next: NetworkChainProtocol? { get set}
    
    func calculate <T: Codable>(_ unserilized: Data, status: Int) throws -> T
    
}
