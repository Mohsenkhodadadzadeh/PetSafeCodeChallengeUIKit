//
//  ExchangeView.swift
//  PetSafeCodeChallengeUIKit
//
//  Created by Mohsen on 4/25/22.
//

import UIKit

extension ExchangeVC: AnyView {
    
    func update<T>(with result: T) where T : Codable {
        guard let result = result as? BaseEntity, let rateObject = result.rates else {
            return
        }
        
        rates = rateObject
        
        if Double(inputTextField.text ?? "") != nil {
            calculateExchanges()
        }
    }
    
    func update(with error: Error) {
        
        let errorAlert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        
        let doneAction = UIAlertAction(title: "done", style: .default)
        errorAlert.addAction(doneAction)
        
        present(errorAlert, animated: true)
    }
    
    func calculateExchanges() {
        
        guard let rates = rates else { return }
        
        let mirrorRateObject = Mirror(reflecting: rates)
        
        guard let baseAmountString = inputTextField.text, let baseAmount = Double(baseAmountString) else { return }
        
        exchangeData = []
        
        for child in mirrorRateObject.children {
            if let key = SymbolsEnums(rawValue: child.label ?? ""), let value = child.value as? Double {
                let exchangeDataName = ExchangeSymbols.shared.get(symbol: key)
                let exchangeRate = baseAmount * value
                exchangeData.append((exchangeDataName, exchangeRate))
            }
        }
        tableviewHandler.exchangeData = exchangeData
        tableView.reloadData()
        
    }
}
