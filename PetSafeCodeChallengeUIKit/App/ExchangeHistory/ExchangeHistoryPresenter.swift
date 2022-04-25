//
//  ExchangeHistoryPresenter.swift
//  PetSafeCodeChallengeUIKit
//
//  Created by Mohsen on 4/25/22.
//

import Foundation

class ExchangeHistoryPresenter: AnyPresenter {
    var router: AnyRouter?
    
    var interactor: AnyInteractor?
    
    var view: AnyView?
    
    func interactorDidFetch<T>(with result: Result<T, Error>) where T : Decodable, T : Encodable {
        switch result {
        case .success(let exchanges):
            view?.update(with: exchanges)
        case .failure(let error):
            view?.update(with: error)
        }
    }
    
}
