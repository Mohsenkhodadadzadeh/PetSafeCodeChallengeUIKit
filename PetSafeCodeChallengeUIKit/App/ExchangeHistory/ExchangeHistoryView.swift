//
//  ExchangeHistoryView.swift
//  PetSafeCodeChallengeUIKit
//
//  Created by Mohsen on 4/25/22.
//

import UIKit

extension ExchangeHistoryVC: AnyView {
    
    
    func update<T>(with result: T) where T : Decodable, T : Encodable {
        guard let resultObj = result as? TimeSeriesEntity, let rates = resultObj.rates?.objects else {
            return
        }
        var ratesObjects: [[String]] = []
        
        ratesObjects.append(["Date"])
        for item in symbolItems ?? [] {
            ratesObjects[0].append(item.rawValue)
        }
        
        for item in rates {
            var row: [String] = [item.date ?? ""]
            for symbol in symbolItems ?? [] {
                let mirrorRateObject = Mirror(reflecting: item)
                
                for child in mirrorRateObject.children {
                    if let key = SymbolsEnums(rawValue: child.label ?? ""), let value = child.value as? Double, key == symbol {
                        row.append(String(format: "%.2f", value))
                    }
                }
            }
            ratesObjects.append(row)
        }
        
        collectionViewHandler.data = ratesObjects
        collectionView.reloadData()
    }
    
    func update(with error: Error) {
        let retTest = [["Date", "USD", "AED"], ["22-10-2022", "1.2", "8"], ["21-10-2022","1.23", "7"]]
        collectionViewHandler.data = retTest
        collectionView.reloadData()
        
        let errorAlert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        
        let doneAction = UIAlertAction(title: "done", style: .default)
        errorAlert.addAction(doneAction)
        
        present(errorAlert, animated: true)
    }
    }

