//
//  Network.swift
//  PetSafeCodeChallengeUIKit
//
//  Created by Mohsen on 4/25/22.
//

import Foundation

public final class Network {
    
    internal let baseURLString: String
    
    internal let session = URLSession.shared
    
    // MARK: - Class Constructors
    public static let shared: Network = {
        let retObj = "http://data.fixer.io/api"
        return Network(baseURLString: retObj)
    }()
    
    // MARK: - Object Lifecycle
    private init(baseURLString: String) {
      self.baseURLString = baseURLString
    }
    
    func getData<T: Codable>(command: String, success _success: @escaping(T) -> Void,
                             failure _failure: @escaping(NetworkErrors) -> Void) {
        
        
        
        let success: (T) -> Void = { value in
            DispatchQueue.main.async { _success(value) }
        }
        
        let failure: (NetworkErrors) -> Void = { error in
            DispatchQueue.main.async { _failure(error) }
        }
        
        guard let accessToken = ProcessInfo.processInfo.environment["access_key"] else {
            failure(NetworkErrors.accessTokenDoesNotExist)
            return
        }
        
        guard let destinationUrl = URL(string: "\(baseURLString)/\(command)access_key=\(accessToken)") else {
            failure(NetworkErrors.nilUrl)
            return
        }
        
        var successResponse: NetworkChainProtocol = SuccessResponse()
        var fixerErrorResponse: NetworkChainProtocol = FixerErrorResponse()
        let internalServerError: NetworkChainProtocol = InternalServerError()
        
        successResponse.next = fixerErrorResponse
        fixerErrorResponse.next = internalServerError
        
        let task = session.dataTask(with: destinationUrl) { (data, response, error) in
            
            if let httpResponse = response as? HTTPURLResponse, let data = data {
                do {
                    let val: T = try successResponse.calculate(data, status: httpResponse.statusCode)
                    success(val)
                } catch {
                    if let err = error as? NetworkErrors {
                        failure(err)
                    } else {
                        failure(.unknownError(errorDescription: error.localizedDescription))
                    }
                }
            } else {
                failure(.unknownError(errorDescription: "server did not respond"))
            }
        }
        
        task.resume()
    }
}
