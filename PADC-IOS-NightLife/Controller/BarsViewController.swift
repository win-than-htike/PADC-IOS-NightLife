//
//  BarsViewController.swift
//  PADC-IOS-NightLife
//
//  Created by Phyo Thinzar Aung on 12/4/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

class BarsViewController: UIViewController {

    @IBOutlet weak var collectionViewBars: UICollectionView!
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var barList : [PlaceVO] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewBars.delegate = self
        collectionViewBars.dataSource = self
        
        registerCell()

        LoadingIndicatorView.show("Loading")
        
        DataModel.shared.getPlaces(type: "bar", success: { (data) in
            
            self.barList.removeAll()
            self.barList.append(contentsOf: data)
            self.collectionViewBars.reloadData()
            
            LoadingIndicatorView.hide()
        }, failure: {
            
        })
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func registerCell()  {
        CellRegisterUtils.cellRegister(nibName: "PromotionCollectionViewCell", collectionView: collectionViewBars)
        CellRegisterUtils.cellRegister(nibName: "CollectionViewCell", collectionView: collectionViewBars)
    }

}

extension BarsViewController : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else {
            return barList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PromotionCollectionViewCell", for: indexPath) as! PromotionCollectionViewCell
            cell.delegate = self
            cell.loadPopularList(type: "bar")
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
            
            let bar = self.barList[indexPath.row]
            cell.lblShopName.text = bar.shopName
            cell.lblShopType.text = bar.shopType
            cell.lblRating.text = "Rating: " + bar.rating
            cell.imgShop.sd_setImage(with: URL(string: bar.shopImage), placeholderImage: UIImage(named: "no-image"))
            return cell
        }
    }
}

extension BarsViewController : UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
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
        let bar = barList[indexPath.row]
        let navigationController = UIStoryboard(name: "Details", bundle: nil).instantiateViewController(withIdentifier: "DetailsViewController") as! UINavigationController
        let vc = navigationController.viewControllers[0] as! DetailsViewController
        vc.shop = bar
        self.present(navigationController, animated: true, completion: nil)
    }
}

extension BarsViewController : PromotionDelegate {
    
    func promotionDetails(shop: PlaceVO) {
        let navigationController = UIStoryboard(name: "Details", bundle: nil).instantiateViewController(withIdentifier: "DetailsViewController") as! UINavigationController
        let vc = navigationController.viewControllers[0] as! DetailsViewController
        vc.shop = shop
        self.present(navigationController, animated: true, completion: nil)
    }
    
}
