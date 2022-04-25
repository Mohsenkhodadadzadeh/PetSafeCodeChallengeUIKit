//
//  ExchangeHistoryCVCell.swift
//  PetSafeCodeChallengeUIKit
//
//  Created by Mohsen on 4/25/22.
//

import UIKit

class ExchangeHistoryCVCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    func setup(_ title: String, isHeader: Bool = false) {
        if isHeader {
            titleLabel.font = .boldSystemFont(ofSize: 12)
            backgroundColor = .gray
        } else {
            titleLabel.font = .systemFont(ofSize: 12)
            backgroundColor = .white
        }
        titleLabel.text = title
        
    }
    
    
}
