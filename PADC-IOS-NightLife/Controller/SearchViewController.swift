//
//  SearchViewController.swift
//  PADC-IOS-NightLife
//
//  Created by Phyo Thinzar Aung on 12/13/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController , UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate {
    @IBOutlet weak var collectionViewShops: UICollectionView!
    
    var searchController : UISearchController!
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var shopList : [PlaceVO] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchController = UISearchController(searchResultsController:  nil)
        
        self.searchController.searchResultsUpdater = self
        self.searchController.delegate = self
        self.searchController.searchBar.delegate = self
        
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.dimsBackgroundDuringPresentation = true
        searchController.obscuresBackgroundDuringPresentation = false
        
        self.navigationItem.titleView = searchController.searchBar
        
        self.definesPresentationContext = true
        
        
        collectionViewShops.delegate = self
        collectionViewShops.dataSource = self
        
        registerCell()
        
        LoadingIndicatorView.show("Loading")
        
        DataModel.shared.getAllPlaces(success: { (data) in
            
            self.shopList.removeAll()
            self.shopList.append(contentsOf: data)
            self.collectionViewShops.reloadData()
            
            LoadingIndicatorView.hide()
        }, failure: {
            
        })
    }
    
    func registerCell()  {
        CellRegisterUtils.cellRegister(nibName: "CollectionViewCell", collectionView: collectionViewShops)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        //self.shopList = Array(shopList.prefix(1))
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("search clicked")
        
        LoadingIndicatorView.show("Loading")
        
        DataModel.shared.getSearchPlaces(shopName: searchBar.text!,success: { (data) in
            
            self.shopList.removeAll()
            self.shopList.append(contentsOf: data)
            self.collectionViewShops.reloadData()
            
            LoadingIndicatorView.hide()

        }, failure: {

        })
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension SearchViewController : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shopList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        let shop = self.shopList[indexPath.row]
        cell.lblShopName.text = shop.shopName
        cell.lblShopType.text = shop.shopType
        cell.lblRating.text = "Rating: " + shop.rating
        cell.imgShop.sd_setImage(with: URL(string: shop.shopImage), placeholderImage: UIImage(named: "no-image"))
        
        return cell
    }
    
    
}

extension SearchViewController : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
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
        let shop = self.shopList[indexPath.row]
        let navigationController = UIStoryboard(name: "Details", bundle: nil).instantiateViewController(withIdentifier: "DetailsViewController") as! UINavigationController
        let vc = navigationController.viewControllers[0] as! DetailsViewController
        vc.shop = shop
        self.present(navigationController, animated: true, completion: nil)
    }
}
