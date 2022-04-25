//
//  AnyView.swift
//  PetSafeCodeChallengeUIKit
//
//  Created by Mohsen on 4/25/22.
//

import Foundation

protocol AnyView {
    var presenter: AnyPresenter? { get set }
    
    func update<T: Codable>(with result: T)
    func update(with error: Error)
}
