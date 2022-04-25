//
//  ExchangeSymbols.swift
//  PetSafeCodeChallengeUIKit
//
//  Created by Mohsen on 4/25/22.
//

import Foundation

final class ExchangeSymbols {
    
    public static var shared: ExchangeSymbols = ExchangeSymbols()
    
    private var symbols: [SymbolsEnums: String] = [:]
    
    init() {
        fetchData()
    }
    
    func callForInit() {
        //do nothing, it is just called to initialize shaerd
    }
    
    private func fetchData() {
        Network.shared.getData(command: "symbols?"
                               , success: { (result: SymbolsEntity) in
            guard let _symbols = result.symbols else {
                return
            }
            for (key, value) in _symbols {
                if let validAbbrivation = SymbolsEnums(rawValue: key) {
                    self.symbols[validAbbrivation] = value
                }
            }
        }, failure: { error in
            //Nothing to do
        })
    }
    
    func get(symbol: SymbolsEnums) -> String {
        
        return symbols[symbol] ?? symbol.rawValue
    
    }
}
