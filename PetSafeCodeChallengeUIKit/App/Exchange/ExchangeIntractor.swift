//
//  ExchangeIntractor.swift
//  PetSafeCodeChallengeUIKit
//
//  Created by Mohsen on 4/25/22.
//

import Foundation

class ExchangeIntractor: AnyInteractor {
   
    var presenter: AnyPresenter?
    
    func getData(parameters: [String : Any]? = nil) {
        
        guard let parameters = parameters else {
            return
        }
        
        var query: String = ""
        
        for (key, value) in parameters {
            query += "\(key)=\(value)&"
        }
        
        Network.shared.getData(command: "latest?\(query)") { [weak self] (result: BaseEntity) in
            
            (self?.presenter as? ExchangePresenter)?.interactorDidFetch(with: .success(result))
        } failure: { [weak self] error in
            
            let retObj: Result<BaseEntity, Error> = .failure(error)
            (self?.presenter as? ExchangePresenter)?.interactorDidFetch(with: retObj)
        }
    }
}
