//
//  InternalServerError.swift
//  PetSafeCodeChallengeUIKit
//
//  Created by Mohsen on 4/25/22.
//

import Foundation

class InternalServerError: NetworkChainProtocol {
    
    var next: NetworkChainProtocol?
    
    func calculate<T: Codable>(_ unserilized: Data, status: Int) throws -> T {
        if status == 500 {
            throw(NetworkErrors.internalServerError)
        }
        if next != nil {
            return try next!.calculate(unserilized, status: status)
        }
        throw(NetworkErrors.endOfChain)
    }
}
