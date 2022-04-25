//
//  ExchangeRouter.swift
//  PetSafeCodeChallengeUIKit
//
//  Created by Mohsen on 4/25/22.
//

import Foundation

class ExchangeRouter: AnyRouter {
    
    var view: EntryPoint?
    
    static func start() -> AnyRouter {
        
        let router = ExchangeRouter()
        
        var view: AnyView = ExchangeVC()
        var presenter: AnyPresenter = ExchangePresenter()
        var interactor: AnyInteractor = ExchangeIntractor()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        
        router.view = view as? EntryPoint
        
        return router
    }
    
    @discardableResult
    static func start(_ view: EntryPoint) -> AnyRouter {
        let router = ExchangeRouter()
        
        var _view: AnyView = view
        var presenter: AnyPresenter = ExchangePresenter()
        var interactor: AnyInteractor = ExchangeIntractor()
        
        _view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.router = router
        presenter.view = _view
        presenter.interactor = interactor
        
        router.view = _view as? EntryPoint
        
        return router
    }
    
    @discardableResult
    static func start(_ view: AnyView) -> AnyRouter {
        let router = ExchangeRouter()
        
        var _view: AnyView = view
        var presenter: AnyPresenter = ExchangePresenter()
        var interactor: AnyInteractor = ExchangeIntractor()
        
        _view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.router = router
        presenter.view = _view
        presenter.interactor = interactor
        
        router.view = _view as? EntryPoint
        
        return router
    }
}
