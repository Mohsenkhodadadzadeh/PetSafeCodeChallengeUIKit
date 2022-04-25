//
//  NetworkErrors.swift
//  PetSafeCodeChallengeUIKit
//
//  Created by Mohsen on 4/25/22.
//

import Foundation

enum NetworkErrors: Error {
    
    case internalServerError
    
    case nilUrl
    
    case endOfChain
    
    case fixerError(errorId: Int, errorInfo: String?)
    
    case convertToModelError(data: String?)
    
    case unknownError(errorDescription: String?)
    
    case accessTokenDoesNotExist
    
}

extension NetworkErrors: LocalizedError {
    
    var errorDescription: String? {
    
        switch self {

        case .internalServerError: return "An error accures on the server"
    
        case .nilUrl: return "Url was received nil"
            
        case .endOfChain: return "Undifined error"
        
        case .fixerError(let errorId, let errorInfo):
            if let errorInfo = errorInfo {
                return errorInfo
            }
            return getFixerErrorDetail(errorId)
            
        case .convertToModelError(let data): return "convert data to model failed for \(data != nil ? data! : "")"
            
        case .unknownError(let errorDescription): return "new error was occured in line \(#line) , Network->\(#function): \(String(describing: errorDescription))"
            
        case .accessTokenDoesNotExist:
            return "please attach the access token regarding the project's readme"
            
        }
    }
    
    var errorTag: Int? {
        
        switch self {

        case .fixerError(let errorId, _): return errorId
            
        default: return nil
        
        }
        
        
    }
    
    private func getFixerErrorDetail(_ errorId: Int) -> String {
       
        switch errorId {
            
        case 404:
            return "The requested resource does not exist."
        
        case 101:
            return "No API Key was specified or an invalid API Key was specified."
        
        case 103:
            return "The requested API endpoint does not exist."
            
        case 104:
                return "The maximum allowed API amount of monthly API requests has been reached."
            
        case 105:
            return "The current subscription plan does not support this API endpoint."
            
        case 106:
            return "The current request did not return any results."
            
        case 102:
            return "The account this API request is coming from is inactive."
            
        case 201:
            return "An invalid base currency has been entered."
            
        case 202:
            return "One or more invalid symbols have been specified."
            
        case 301:
            return "No date has been specified. [$1]"
            
        case 302:
            return "An invalid date has been specified. [$1, $2]"
            
        case 403:
            return "No or an invalid amount has been specified. [$1]"
            
        case 501:
            return "No or an invalid timeframe has been specified. [$1]"
            
        case 502:
            return "No or an invalid \"start_date\" has been specified. [$1, $2]"
            
        case 503:
            return "No or an invalid \"end_date\" has been specified. [$1, $2]"
            
        case 504:
            return "An invalid timeframe has been specified. [$1, $2]"
            
        case 505:
            return "The specified timeframe is too long, exceeding 365 days. [$1, $2]"
            
        default:
            return "error code isn't valid"
        
        }
    }
}
