//
//  ExchangeTVC.swift
//  PetSafeCodeChallengeUIKit
//
//  Created by Mohsen on 4/25/22.
//

import UIKit

class ExchangeTVC: UITableViewCell {

    @IBOutlet weak var symbolNameLabel: UILabel!
    @IBOutlet weak var exchangeRateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fillData(name: String, rate: Double?) {
        symbolNameLabel.text = name
        if let rate = rate {
            exchangeRateLabel.text = String(format: "%.2f", rate)
        } else {
            exchangeRateLabel.text = ""
        }
    }
}
