//
//  AnyRouter.swift
//  PetSafeCodeChallengeUIKit
//
//  Created by Mohsen on 4/25/22.
//

import UIKit

typealias EntryPoint = AnyView & UIViewController
protocol AnyRouter {
    var view: EntryPoint? { get set }
    static func start() -> AnyRouter
}
