//
//  TimeSeriesRateEntity.swift
//  PetSafeCodeChallengeUIKit
//
//  Created by Mohsen on 4/25/22.
//

import Foundation

struct TimeSeriesRatesEntity: Codable {
    
    var objects: [TimeSeriesRateEntity]
    
    private struct DynamicCodingKeys: CodingKey {
        
        var stringValue: String
                init?(stringValue: String) {
                    self.stringValue = stringValue
                }
        
        var intValue: Int?
               init?(intValue: Int) {
                   // We are not using this, thus just return nil
                   return nil
               }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)
        
        var tempArray = [TimeSeriesRateEntity]()
        
        for key in container.allKeys {
            
            let decodedObject = try container.decode(TimeSeriesRateEntity.self, forKey: DynamicCodingKeys(stringValue: key.stringValue)!)
                        tempArray.append(decodedObject)
        }
        objects = tempArray
    }
}
