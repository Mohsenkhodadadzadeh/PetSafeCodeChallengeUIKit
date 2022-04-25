//
//  ExchangeHistoryInteractor.swift
//  PetSafeCodeChallengeUIKit
//
//  Created by Mohsen on 4/25/22.
//

import Foundation

class ExchangeHistoryInteractor: AnyInteractor {
    var presenter: AnyPresenter?
    
    func getData(parameters: [String : Any]?) {
        
        guard let parameters = parameters else {
            return
        }
        
        var query: String = ""
        
        for (key, value) in parameters {
            query += "\(key)=\(value)&"
        }
        
        Network.shared.getData(command: "timeseries?\(query)") { [weak self] (result: BaseEntity) in
            
            self?.presenter?.interactorDidFetch(with: .success(result))
        } failure: { [weak self] error in
            
            let retObj: Result<BaseEntity, Error> = .failure(error)
            self?.presenter?.interactorDidFetch(with: retObj)
        }
        
    }
    
    
}
