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
    
    func registerCell()  {
        CellRegisterUtils.cellRegister(nibName: "BarPromotionCollectionViewCell", collectionView: collectionViewBars)
        CellRegisterUtils.cellRegister(nibName: "BarCollectionViewCell", collectionView: collectionViewBars)
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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BarPromotionCollectionViewCell", for: indexPath) as! BarPromotionCollectionViewCell
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BarCollectionViewCell", for: indexPath) as! BarCollectionViewCell
            return cell
        }
    }
}

extension BarsViewController : UICollectionViewDelegate {
    
}

extension BarsViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 250)
    }
}
