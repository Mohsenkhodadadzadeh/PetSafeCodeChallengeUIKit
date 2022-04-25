//
//  ExchangeHistoryVC.swift
//  PetSafeCodeChallengeUIKit
//
//  Created by Mohsen on 4/25/22.
//

import UIKit

class ExchangeHistoryVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var moneyAmountLabel: UILabel!
    let collectionViewHandler: ExchangeHistoryCVC = ExchangeHistoryCVC()
    var symbolItems: [SymbolsEnums]?
    var moneyAmount: Double?
    var presenter: AnyPresenter?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        ExchangeHistoryRouter.start(self)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        var parameters: [String: Any] = [:]
        
        let endDate = Date().convertToString()
        
        parameters["start_date"] = endDate
        
        let _StartDate = Calendar.current.date(byAdding: .day, value: -4, to: Date())
        let startDate = _StartDate?.convertToString()
        
        parameters["start_date"] = startDate ?? ""
        presenter?.interactor?.getData(parameters: parameters)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: 100, height: 40)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        collectionView.collectionViewLayout = layout
        collectionView.delegate = collectionViewHandler
        collectionView.dataSource = collectionViewHandler
    }
    
    @IBAction func doneButtonPressed(sender: UIButton) {
        dismiss(animated: true)
    }

}
