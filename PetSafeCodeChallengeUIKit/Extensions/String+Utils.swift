//
//  String+Utils.swift
//  PetSafeCodeChallengeUIKit
//
//  Created by Mohsen on 4/25/22.
//

import Foundation

extension String {
    func convertToDate(timeZone timeZoneString: String = "UTC", dateFormat: String = "yyyy-MM-dd") -> Date? {
            let formatter = DateFormatter()
            let timezone =  TimeZone(identifier: timeZoneString)
            formatter.timeZone = timezone
            formatter.dateFormat = dateFormat
            let date = formatter.date(from: self)
            return date
    }
}
