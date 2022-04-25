//
//  NameOfCurrenciesVC.swift
//  PetSafeCodeChallengeUIKit
//
//  Created by Mohsen on 4/25/22.
//

import Foundation

import UIKit

protocol NameOfCurrenciesDelegate: class {
    func updateIndex(index: Int)
}

class NameOfCurrenciesVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let tableViewHandler = ExchangeTVHandler()
    var exchangeData: [(String, Double?)] = []
    private let symbols = SymbolsEnums.fetchAll()
    weak var delegate: ExchangeVCDelegate?
    private var selectedIndex: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = tableViewHandler
        tableView.dataSource = tableViewHandler
        tableViewHandler.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        exchangeData = []
        for symbol in symbols {
            exchangeData.append((ExchangeSymbols.shared.get(symbol: symbol), nil))
        }
        tableViewHandler.exchangeData = exchangeData
        tableView.reloadData()
    }

    @IBAction func doneButtonPressed(sender: UIButton) {
        if let selectedIndex = selectedIndex {
            delegate?.update(symbol: symbols[safe: selectedIndex] ?? .EUR)
        }
        dismiss(animated: true)
    }
    
    @IBAction func cancelButtonPressed(sender: UIButton) {
        dismiss(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension NameOfCurrenciesVC: NameOfCurrenciesDelegate {
    func updateIndex(index: Int) {
        selectedIndex = index
    }
    
    
}
