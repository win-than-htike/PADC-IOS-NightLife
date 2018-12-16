//
//  RestaurantsViewController.swift
//  PADC-IOS-NightLife
//
//  Created by Phyo Thinzar Aung on 12/4/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit
import SDWebImage

class RestaurantsViewController: UIViewController {

    @IBOutlet weak var collectionViewRestaurants: UICollectionView!
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var restaurantList : [PlaceVO] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionViewRestaurants.delegate = self
        collectionViewRestaurants.dataSource = self
        
        registerCell()
        
        LoadingIndicatorView.show("Loading")
        
        DataModel.shared.getPlaces(type: "Restaurant", success: { (data) in
            
            self.restaurantList.removeAll()
            self.restaurantList.append(contentsOf: data)
            self.collectionViewRestaurants.reloadData()
            
            LoadingIndicatorView.hide()
        }, failure: {
            
        })
    }
    
    func registerCell()  {
        CellRegisterUtils.cellRegister(nibName: "PromotionCollectionViewCell", collectionView: collectionViewRestaurants)
        CellRegisterUtils.cellRegister(nibName: "CollectionViewCell", collectionView: collectionViewRestaurants)
    }
    
    
}

extension RestaurantsViewController : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else {
            return restaurantList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PromotionCollectionViewCell", for: indexPath) as! PromotionCollectionViewCell
            cell.loadPopularList(type: "Restaurant")
            cell.delegate = self
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
            
            let restaurant = self.restaurantList[indexPath.row]
            cell.lblShopName.text = restaurant.shopName
            cell.lblShopType.text = restaurant.shopType
            cell.lblRating.text = "Rating: " + restaurant.rating
            cell.imgShop.sd_setImage(with: URL(string: restaurant.shopImage), placeholderImage: UIImage(named: "no-image"))
            
            return cell
        }
    }
    
}

extension RestaurantsViewController : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
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
        let restaurant = self.restaurantList[indexPath.row]
        let navigationController = UIStoryboard(name: "Details", bundle: nil).instantiateViewController(withIdentifier: "DetailsViewController") as! UINavigationController
        let vc = navigationController.viewControllers[0] as! DetailsViewController
        vc.shop = restaurant
        self.present(navigationController, animated: true, completion: nil)
    }
    
}

extension RestaurantsViewController : PromotionDelegate {
    
    func promotionDetails(shop: PlaceVO) {
        let navigationController = UIStoryboard(name: "Details", bundle: nil).instantiateViewController(withIdentifier: "DetailsViewController") as! UINavigationController
        let vc = navigationController.viewControllers[0] as! DetailsViewController
        print(shop.shopName)
        vc.shop = shop
        //cell.promoList = Array(self.restaurantList.prefix(5))
        self.present(navigationController, animated: true, completion: nil)
    }
    
}
