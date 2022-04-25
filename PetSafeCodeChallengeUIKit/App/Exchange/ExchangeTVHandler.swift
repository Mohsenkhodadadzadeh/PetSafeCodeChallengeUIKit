//
//  ExchangeTVHandler.swift
//  PetSafeCodeChallengeUIKit
//
//  Created by Mohsen on 4/25/22.
//

import UIKit

class ExchangeTVHandler : NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var exchangeData: [(String, Double?)] = []
    
    private var selectedSymbols: [SymbolsEnums: Bool] = [:]
    
    weak var delegate: SelectedRowsInTableDelegate?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        exchangeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExchangeTVC", for: indexPath) as! ExchangeTVC
        if let (name, rate) = exchangeData[safe: indexPath.row] {
            cell.fillData(name: name, rate: rate)
        } else {
            cell.fillData(name: "", rate: 0)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        delegate?.updateIndex(index: indexPath.row)
        
        if let selectedItem = exchangeData[safe: indexPath.row]?.0 {
            let symbol = ExchangeSymbols.shared.get(fullName: selectedItem)
            selectedSymbols[symbol] = true
            let retObj = selectedSymbols.map({ $0.key })
                delegate?.update(rows: retObj)
            
            
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        if let selectedItem = exchangeData[safe: indexPath.row]?.0 {
            let symbol = ExchangeSymbols.shared.get(fullName: selectedItem)
            selectedSymbols[symbol] = nil
            let retObj = selectedSymbols.map({ $0.key })
                delegate?.update(rows: retObj)
        }
    }
}
