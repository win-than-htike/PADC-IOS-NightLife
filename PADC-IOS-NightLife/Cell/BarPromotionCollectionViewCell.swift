//
//  BarPromotionCollectionViewCell.swift
//  PADC-IOS-NightLife
//
//  Created by Phyo Thinzar Aung on 12/13/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

class BarPromotionCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var collectionViewEventPromotion: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionViewEventPromotion.delegate = self
        collectionViewEventPromotion.dataSource = self
        
        CellRegisterUtils.cellRegister(nibName: "EventsCollectionViewCell", collectionView: collectionViewEventPromotion)
    }

}

extension BarPromotionCollectionViewCell : UICollectionViewDelegate {
    
}

extension BarPromotionCollectionViewCell : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EventsCollectionViewCell", for: indexPath) as! EventsCollectionViewCell
        return cell
    }
    
    
}

extension BarPromotionCollectionViewCell : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 320, height: 250)
    }
}
