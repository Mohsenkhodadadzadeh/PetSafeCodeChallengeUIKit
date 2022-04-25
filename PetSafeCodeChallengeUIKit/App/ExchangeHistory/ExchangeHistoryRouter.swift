//
//  ExchangeHistoryRouter.swift
//  PetSafeCodeChallengeUIKit
//
//  Created by Mohsen on 4/25/22.
//

import Foundation

class ExchangeHistoryRouter: AnyRouter {
    var view: EntryPoint?
    
    static func start() -> AnyRouter {
        
        let router = ExchangeHistoryRouter()
        
        var view: AnyView = ExchangeHistoryVC()
        var presenter: AnyPresenter = ExchangeHistoryPresenter()
        var interactor: AnyInteractor = ExchangeHistoryInteractor()
        
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
        let router = ExchangeHistoryRouter()
        
        var _view: AnyView = view
        var presenter: AnyPresenter = ExchangeHistoryPresenter()
        var interactor: AnyInteractor = ExchangeHistoryInteractor()
        
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
        let router = ExchangeHistoryRouter()
        
        var _view: AnyView = view
        var presenter: AnyPresenter = ExchangeHistoryPresenter()
        var interactor: AnyInteractor = ExchangeHistoryInteractor()
        
        _view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.router = router
        presenter.view = _view
        presenter.interactor = interactor
        
        router.view = _view as? EntryPoint
        
        return router
    }
}
