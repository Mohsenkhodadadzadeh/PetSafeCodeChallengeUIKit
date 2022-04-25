//
//  TimeSeriesRateEntity.swift
//  PetSafeCodeChallengeUIKit
//
//  Created by Mohsen on 4/25/22.
//

import Foundation

struct TimeSeriesRateEntity: Codable {
    
    let date: String?
    
    let AUD: Double?
    
    let USD: Double?
    
    let EUR: Double?
    
    let JPY: Double?
    
    let GBP: Double?
    
    let CAD: Double?
    
    let CHF: Double?
    
    let CNY: Double?
    
    let SEK: Double?
    
    let NZD: Double?
    
    enum CodingKeys: CodingKey {
        case AUD
        case USD
        case EUR
        case JPY
        case GBP
        case CAD
        case CHF
        case CNY
        case SEK
        case NZD
    }
    
    init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)

        AUD = try container.decode(Double.self, forKey: CodingKeys.AUD)
        USD = try container.decode(Double.self, forKey: CodingKeys.USD)
        EUR = try container.decode(Double.self, forKey: CodingKeys.EUR)
        JPY = try container.decode(Double.self, forKey: CodingKeys.JPY)
        GBP = try container.decode(Double.self, forKey: CodingKeys.GBP)
        CAD = try container.decode(Double.self, forKey: CodingKeys.CAD)
        CHF = try container.decode(Double.self, forKey: CodingKeys.CHF)
        CNY = try container.decode(Double.self, forKey: CodingKeys.CNY)
        SEK = try container.decode(Double.self, forKey: CodingKeys.SEK)
        NZD = try container.decode(Double.self, forKey: CodingKeys.NZD)

        date = container.codingPath.first!.stringValue
       }
}
