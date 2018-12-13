//
//  ViewController.swift
//  PADC-IOS-NightLife
//
//  Created by Win Than Htike on 12/2/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionViewMenu: UICollectionView!
    @IBOutlet weak var tfSearch: UITextField!
    var estimateWidth = 160.0
    var cellMarginSize = 16.0
    
    var menuList: [MenuModel] =
        [
            MenuModel(title: "Restaurant", icon: UIImage(named: "restaurant")!),
            MenuModel(title: "Bar", icon: UIImage(named: "bar")!),
            MenuModel(title: "Club", icon: UIImage(named: "club")!),
            MenuModel(title: "KTV", icon: UIImage(named: "ktv")!)
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpCollectionView()
        self.setupGridView()
        
        tfSearch.isUserInteractionEnabled = true
        tfSearch.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.searchTap(gesture:))))
    }
    
    @objc func searchTap(gesture : UITapGestureRecognizer){
        let navigationController = UIStoryboard(name: "Search", bundle: nil).instantiateViewController(withIdentifier: "SearchViewController") as! UINavigationController
        self.present(navigationController, animated: true, completion: nil)
    }
    
    func setUpCollectionView() {
        self.collectionViewMenu.delegate = self
        self.collectionViewMenu.dataSource = self
    }

    func setupGridView() {
        let flow = collectionViewMenu?.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
        flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.menuList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let menu = menuList[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCollectionViewCell", for: indexPath) as! MenuCollectionViewCell
        cell.setMenu(menu: menu)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            let navigationController = UIStoryboard(name: "Restaurant", bundle: nil).instantiateViewController(withIdentifier: "RestaurantsViewController") as! UINavigationController
            self.present(navigationController, animated: true, completion: nil)
            break
            
        case 1:
            let navigationController = UIStoryboard(name: "Bar", bundle: nil).instantiateViewController(withIdentifier: "BarsViewController") as! UINavigationController
            self.present(navigationController, animated: true, completion: nil)
            break
            
        case 2:
            let navigationController = UIStoryboard(name: "Event", bundle: nil).instantiateViewController(withIdentifier: "EventsViewController") as! UINavigationController
            self.present(navigationController, animated: true, completion: nil)
            break
            
        case 3:
            let navigationController = UIStoryboard(name: "KTV", bundle: nil).instantiateViewController(withIdentifier: "KTVsViewController") as! UINavigationController
            self.present(navigationController, animated: true, completion: nil)
            break
            
        default:
            let navigationController = UIStoryboard(name: "Restaurant", bundle: nil).instantiateViewController(withIdentifier: "RestaurantsViewController") as! UINavigationController
            self.present(navigationController, animated: true, completion: nil)
            break

        }
        
        collectionViewMenu.deselectItem(at: indexPath, animated: true)
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.calculateWith()
        return CGSize(width: width, height: 170)
    }
    
    func calculateWith() -> CGFloat {
        let estimatedWidth = CGFloat(estimateWidth)
        let cellCount = floor(CGFloat(self.view.frame.size.width / estimatedWidth))
        
        let margin = CGFloat(cellMarginSize * 2)
        let width = (self.view.frame.size.width - CGFloat(cellMarginSize) * (cellCount - 1) - margin) / cellCount
        
        return width
    }
}


