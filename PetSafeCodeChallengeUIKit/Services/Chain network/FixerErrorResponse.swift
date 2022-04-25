//
//  FixerErrorResponse.swift
//  PetSafeCodeChallengeUIKit
//
//  Created by Mohsen on 4/25/22.
//

import Foundation

class FixerErrorResponse: NetworkChainProtocol {
    
    var next: NetworkChainProtocol?
    
    func calculate<T: Codable>(_ unserilized: Data, status: Int) throws -> T {
        
        if status == 200 {
            var retObj: T
            do {
                retObj = try JSONDecoder().decode(T.self, from: unserilized)
            } catch {
                throw(NetworkErrors.convertToModelError(data: String(data: unserilized, encoding: .utf8)))
            }
            if let checkError = retObj as? GenericEntity, let errorId = checkError.error?.code {
                if checkError.error != nil {
                    throw(NetworkErrors.fixerError(errorId: errorId, errorInfo: checkError.error?.info))
                }
            }
        }
        if next != nil {
            return try next!.calculate(unserilized, status: status)
        }
        throw(NetworkErrors.endOfChain)
    }
}
