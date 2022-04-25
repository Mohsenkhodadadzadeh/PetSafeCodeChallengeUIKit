//
//  ExchangeHistoryCVC.swift
//  PetSafeCodeChallengeUIKit
//
//  Created by Mohsen on 4/25/22.
//

import UIKit


class ExchangeHistoryCVC: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var data: [[String]] = []
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return data.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if !data.isEmpty {
            return (data[section].count) 
        }
        return 0
    }
    
    private func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSize(width: 100, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExchangeHistoryCVCell", for: indexPath) as! ExchangeHistoryCVCell
        if indexPath.row < data[0].count { // Header
            cell.setup(data[safe: indexPath.section]?[safe: indexPath.row] ?? "", isHeader: true)
        }
        cell.setup(data[safe: indexPath.section]?[safe: indexPath.row] ?? "")
        
        return cell
    }
    
    
}
