//
//  KTVsViewController.swift
//  PADC-IOS-NightLife
//
//  Created by Phyo Thinzar Aung on 12/4/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

class KTVsViewController: UIViewController {

    @IBOutlet weak var collectionViewKTV: UICollectionView!
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var ktvList : [PlaceVO] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionViewKTV.delegate = self
        collectionViewKTV.dataSource = self
        
        registerCell()
        
        LoadingIndicatorView.show("Loading")
        
        DataModel.shared.getPlaces(type: "ktv", success: { (data) in
            
            self.ktvList.removeAll()
            self.ktvList.append(contentsOf: data)
            self.collectionViewKTV.reloadData()
            
            LoadingIndicatorView.hide()
        }, failure: {
            
        })
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func registerCell()  {
        CellRegisterUtils.cellRegister(nibName: "PromotionCollectionViewCell", collectionView: collectionViewKTV)
        CellRegisterUtils.cellRegister(nibName: "CollectionViewCell", collectionView: collectionViewKTV)
    }

}

extension KTVsViewController : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else {
            return ktvList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PromotionCollectionViewCell", for: indexPath) as! PromotionCollectionViewCell
            cell.delegate = self
            cell.loadPopularList(type: "ktv")
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
            
            let ktv = self.ktvList[indexPath.row]
            cell.lblShopName.text = ktv.shopName
            cell.lblShopType.text = ktv.shopType
            cell.lblRating.text = "Rating: " + ktv.rating
            cell.imgShop.sd_setImage(with: URL(string: ktv.shopImage), placeholderImage: UIImage(named: "no-image"))
            
            return cell
        }
    }
}

extension KTVsViewController : UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.frame.width
        return CGSize(width: width, height: 220)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let ktv = ktvList[indexPath.row]
        let navigationController = UIStoryboard(name: "Details", bundle: nil).instantiateViewController(withIdentifier: "DetailsViewController") as! UINavigationController
        let vc = navigationController.viewControllers[0] as! DetailsViewController
        vc.shop = ktv
        self.present(navigationController, animated: true, completion: nil)
    }
}

extension KTVsViewController : PromotionDelegate {
    
    func promotionDetails(shop: PlaceVO) {
        let navigationController = UIStoryboard(name: "Details", bundle: nil).instantiateViewController(withIdentifier: "DetailsViewController") as! UINavigationController
        let vc = navigationController.viewControllers[0] as! DetailsViewController
        vc.shop = shop
        self.present(navigationController, animated: true, completion: nil)
    }
    
}
