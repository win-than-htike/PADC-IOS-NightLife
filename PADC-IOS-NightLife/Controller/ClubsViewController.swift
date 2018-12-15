//
//  ClubsViewController.swift
//  PADC-IOS-NightLife
//
//  Created by Phyo Thinzar Aung on 12/4/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

class ClubsViewController: UIViewController {

    @IBOutlet weak var collectionViewClub: UICollectionView!
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var clubList : [PlaceVO] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionViewClub.delegate = self
        collectionViewClub.dataSource = self

        registerCell()
        
        LoadingIndicatorView.show("Loading")
        
        DataModel.shared.getPlaces(type: "club", success: { (data) in
            
            self.clubList.removeAll()
            self.clubList.append(contentsOf: data)
            self.collectionViewClub.reloadData()
            
            LoadingIndicatorView.hide()
        }, failure: {
            
        })
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func registerCell()  {
        CellRegisterUtils.cellRegister(nibName: "PromotionCollectionViewCell", collectionView: collectionViewClub)
        CellRegisterUtils.cellRegister(nibName: "CollectionViewCell", collectionView: collectionViewClub)
    }

}

extension ClubsViewController : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else {
            return clubList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PromotionCollectionViewCell", for: indexPath) as! PromotionCollectionViewCell
            cell.delegate = self
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
            
            let club = self.clubList[indexPath.row]
            cell.lblShopName.text = club.shopName
            cell.lblShopType.text = club.shopType
            cell.lblRating.text = "Rating: " + club.rating
            cell.imgShop.sd_setImage(with: URL(string: club.shopImage), placeholderImage: UIImage(named: "no-image"))
            
            return cell
        }
    }
    
    
}

extension ClubsViewController : UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
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
        let club = clubList[indexPath.row]
        let navigationController = UIStoryboard(name: "Details", bundle: nil).instantiateViewController(withIdentifier: "DetailsViewController") as! UINavigationController
        let vc = navigationController.viewControllers[0] as! DetailsViewController
        vc.shop = club
        self.present(navigationController, animated: true, completion: nil)
    }
}

extension ClubsViewController : PromotionDelegate {
    func promotionDetails() {
        let navigationController = UIStoryboard(name: "Details", bundle: nil).instantiateViewController(withIdentifier: "DetailsViewController") as! UINavigationController
        self.present(navigationController, animated: true, completion: nil)
    }
    
    
}
