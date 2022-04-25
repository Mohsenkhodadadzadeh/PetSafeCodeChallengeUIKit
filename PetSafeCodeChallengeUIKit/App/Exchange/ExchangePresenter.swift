//
//  ExchangePresenter.swift
//  PetSafeCodeChallengeUIKit
//
//  Created by Mohsen on 4/25/22.
//

import Foundation

class ExchangePresenter: AnyPresenter {
    var router: AnyRouter?
    
    var interactor: AnyInteractor?
    
    var view: AnyView?
    
    func interactorDidFetch<T>(with result: Result<T, Error>) where T: Codable {
        
        switch result {
        case .success(let exchanges):
            view?.update(with: exchanges)
        case .failure(let error):
            view?.update(with: error)
        }
    }
    
    func getData(with parameters: [String: Any]? = nil) {
        var _parameters: [String: Any] = [:]
        if let parameters = parameters {
            _parameters = parameters
        } else {
            _parameters["base"] = "EUR"
            let symbols = SymbolsEnums.fetchAll()
                .filter({ $0 != .EUR})
                .map{ $0.rawValue }
                .joined(separator: ",")
            _parameters["symbols"] = symbols
        }
        interactor?.getData(parameters: _parameters)
    }
    
}
