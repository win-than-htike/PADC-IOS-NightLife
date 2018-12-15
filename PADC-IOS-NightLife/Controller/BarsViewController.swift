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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewBars.delegate = self
        collectionViewBars.dataSource = self
        
        registerCell()

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
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PromotionCollectionViewCell", for: indexPath) as! PromotionCollectionViewCell
            cell.delegate = self
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
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
        let navigationController = UIStoryboard(name: "Details", bundle: nil).instantiateViewController(withIdentifier: "DetailsViewController") as! UINavigationController
        self.present(navigationController, animated: true, completion: nil)
    }
}

extension BarsViewController : PromotionDelegate {
    func promotionDetails() {
        let navigationController = UIStoryboard(name: "Details", bundle: nil).instantiateViewController(withIdentifier: "DetailsViewController") as! UINavigationController
        self.present(navigationController, animated: true, completion: nil)
    }
    
}
