//
//  RestaurantsViewController.swift
//  PADC-IOS-NightLife
//
//  Created by Phyo Thinzar Aung on 12/4/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

class RestaurantsViewController: UIViewController {

    @IBOutlet weak var collectionViewRestaurants: UICollectionView!
    
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionViewRestaurants.delegate = self
        collectionViewRestaurants.dataSource = self
    }

}

extension RestaurantsViewController : UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let navigationController = UIStoryboard(name: "Restaurant", bundle: nil).instantiateViewController(withIdentifier: "RestaurantDetailViewController") as! UINavigationController
        self.present(navigationController, animated: true, completion: nil)
    }
    
}

extension RestaurantsViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RestaurantCollectionViewCell", for: indexPath) as! RestaurantCollectionViewCell
        return cell
    }
    
    
}
