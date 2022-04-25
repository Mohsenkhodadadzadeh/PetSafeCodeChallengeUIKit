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
    @IBOutlet weak var exchangeRateLabel: UILabel!
    
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
        
        exchangeRateLabel.attributedText = attributedString
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is NameOfCurrenciesVC {
            let vc = segue.destination as? NameOfCurrenciesVC
            vc?.delegate = self
        }
    }

}

extension ExchangeVC: ExchangeVCDelegate {
    func update(symbol: SymbolsEnums) {
        self.baseRate = symbol
    }
    
    
}
