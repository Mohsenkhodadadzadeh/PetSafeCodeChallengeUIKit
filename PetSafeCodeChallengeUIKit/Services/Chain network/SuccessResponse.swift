//
//  SuccessResponse.swift
//  PetSafeCodeChallengeUIKit
//
//  Created by Mohsen on 4/25/22.
//

import Foundation

class SuccessResponse: NetworkChainProtocol {
    
    var next: NetworkChainProtocol?
    
    func calculate<T: Codable>(_ unserilized: Data, status: Int) throws -> T {
        
        if status == 200 {
            do {
                let retObj = try JSONDecoder().decode(T.self, from: unserilized)
                if let checkError = retObj as? GenericEntity {
                    if checkError.error == nil {
                        return retObj
                    }
                } else {
                    return retObj
                }
            } catch {
                throw(NetworkErrors.convertToModelError(data: String(data: unserilized, encoding: .utf8)))
            }
        }
        if next != nil {
            return try next!.calculate(unserilized, status: status)
        }
        throw(NetworkErrors.endOfChain)
    }
}
