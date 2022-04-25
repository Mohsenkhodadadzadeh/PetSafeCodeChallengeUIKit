//
//  ExchangeTVHandler.swift
//  PetSafeCodeChallengeUIKit
//
//  Created by Mohsen on 4/25/22.
//

import UIKit

class ExchangeTVHandler : NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var exchangeData: [(String, Double?)] = []
    
    weak var delegate: NameOfCurrenciesDelegate?
    
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
    }
}
