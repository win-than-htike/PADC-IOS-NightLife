//
//  BarPromotionCollectionViewCell.swift
//  PADC-IOS-NightLife
//
//  Created by Phyo Thinzar Aung on 12/13/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

protocol PromotionDelegate {
    func promotionDetails(shop: PlaceVO)
}

class PromotionCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var collectionViewEventPromotion: UICollectionView!
    @IBOutlet weak var lblPopularShops: UILabel!
    
    var delegate : PromotionDelegate?
    
    var popularList : [PlaceVO] = []
    
    var id: Int? = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionViewEventPromotion.delegate = self
        collectionViewEventPromotion.dataSource = self
        
        CellRegisterUtils.cellRegister(nibName: "EventsCollectionViewCell", collectionView: collectionViewEventPromotion)
    }
    
    func loadPopularList(type: String) {
        
        LoadingIndicatorView.show("Loading")
        self.lblPopularShops.isHidden = true
        
        DataModel.shared.getPopularPlaces(type: type, success: { (data) in
            
            self.popularList.removeAll()
            self.popularList.append(contentsOf: data)
            self.collectionViewEventPromotion.reloadData()
            
            LoadingIndicatorView.hide()
            self.lblPopularShops.isHidden = false
        }, failure: {
            
        })
    }

}

extension PromotionCollectionViewCell : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popularList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EventsCollectionViewCell", for: indexPath) as! EventsCollectionViewCell
        let shop = self.popularList[indexPath.row]
        cell.lblEventTitle.text = shop.shopName
        cell.lblEventType.text = shop.shopType
        cell.rating.rating = Double(shop.rating)!
        cell.ivEventCover.sd_setImage(with: URL(string: (shop.shopImage)), placeholderImage: UIImage(named: "no-image"))
        return cell
    }
    
    
}

extension PromotionCollectionViewCell : UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        delegate?.promotionDetails(shop: popularList[indexPath.row])
    }
    
}
