//
//  ExchangeVC.swift
//  PetSafeCodeChallengeUIKit
//
//  Created by Mohsen on 4/25/22.
//

import UIKit

protocol ExchangeVCDelegate: class {
    func update(symbol: SymbolsEnums)
}



class ExchangeVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var currencyNameLabel: UILabel!
    @IBOutlet weak var historyButton: UIButton!
    
    var selectedItems: [SymbolsEnums] = [] {
        didSet {
            historyButton.isHidden = selectedItems.count < 2
        }
    }
    var presenter: AnyPresenter?
    var baseRate: SymbolsEnums = .EUR {
        didSet {
            renewRate()
            fillExchangeRateLabelText()
        }
    }
    var rates: RatesEntity?
    var exchangeData: [(String, Double?)] = []
    let tableviewHandler = ExchangeTVHandler()
    override func viewDidLoad() {
        super.viewDidLoad()
        ExchangeRouter.start(self)
        
        tableView.dataSource = tableviewHandler
        tableView.delegate = tableviewHandler
        tableviewHandler.delegate = self
        // Do any additional setup after loading the view.
    }
    

    override func viewDidAppear(_ animated: Bool) {
        (presenter as? ExchangePresenter)?.getData()
        fillExchangeRateLabelText()
    }
    
    @IBAction func convertButtonPressed(sender: UIButton) {
        calculateExchanges()
    }
    
    @IBAction func changeBasetRateButtonPressed(sender: UIButton) {
        
    }
    
    @IBAction func historyButtonPressed(sender: UIButton) {
//        let exchangeHistoryRouter = ExchangeHistoryRouter.start()
//        if let view = exchangeHistoryRouter.view as? ExchangeHistoryVC {
//            view.symbolItems = selectedItems
//            view.moneyAmount = Double(inputTextField.text ?? "")
//            self.present(view, animated: true, completion: nil)
//     
//        }
    }
    
    private func renewRate() {
        
        var parameters: [String: Any] = [:]
        parameters["base"] = baseRate.rawValue
        let symbols = SymbolsEnums.fetchAll()
            .filter({ $0 != baseRate})
            .map{ $0.rawValue }
            .joined(separator: ",")
        parameters["symbols"] = symbols
        (presenter as? ExchangePresenter)?.getData(with: parameters)
        
    }
    
    func fillExchangeRateLabelText() {
        let attributedString = NSMutableAttributedString()
        let regularAttribute = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue", size: 13) ?? UIFont.systemFont(ofSize: 13)] as [NSAttributedString.Key: Any]
        let minSpendText = NSAttributedString(string: "the base rate is ", attributes: regularAttribute)
        
        let boldAttribute = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 11) ?? UIFont.boldSystemFont(ofSize: 15)] as [NSAttributedString.Key: Any]
        let priceText = NSAttributedString(string: baseRate.rawValue, attributes: boldAttribute)
        
        attributedString.append(minSpendText)
        attributedString.append(priceText)
        
        currencyNameLabel.attributedText = attributedString
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is NameOfCurrenciesVC {
            let vc = segue.destination as? NameOfCurrenciesVC
            vc?.delegate = self
        } else if segue.destination is ExchangeHistoryVC {
            let vc = segue.destination as? ExchangeHistoryVC
            vc?.symbolItems = selectedItems
            vc?.moneyAmount = Double(inputTextField.text ?? "")
        }
    }

}

extension ExchangeVC: ExchangeVCDelegate {
    func update(symbol: SymbolsEnums) {
        self.baseRate = symbol
    }
    
}

extension ExchangeVC: SelectedRowsInTableDelegate {
    func updateIndex(index: Int) {
        
    }
    
    func update(rows: [SymbolsEnums]) {
        selectedItems = []
        for item in rows {
            selectedItems.append(item)
        }
        
    }
}
