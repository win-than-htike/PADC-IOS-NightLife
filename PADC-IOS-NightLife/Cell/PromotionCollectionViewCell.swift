//
//  BarPromotionCollectionViewCell.swift
//  PADC-IOS-NightLife
//
//  Created by Phyo Thinzar Aung on 12/13/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

protocol PromotionDelegate {
    func promotionDetails()
}

class PromotionCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var collectionViewEventPromotion: UICollectionView!
    
    var delegate : PromotionDelegate?
    
    var promoList : [PlaceVO] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionViewEventPromotion.delegate = self
        collectionViewEventPromotion.dataSource = self
        
        CellRegisterUtils.cellRegister(nibName: "EventsCollectionViewCell", collectionView: collectionViewEventPromotion)
    }

}

extension PromotionCollectionViewCell : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EventsCollectionViewCell", for: indexPath) as! EventsCollectionViewCell
        cell.promoList = self.promoList
        return cell
    }
    
    
}

extension PromotionCollectionViewCell : UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.promotionDetails()
    }
    
}
