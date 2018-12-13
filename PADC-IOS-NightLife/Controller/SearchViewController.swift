//
//  SearchViewController.swift
//  PADC-IOS-NightLife
//
//  Created by Phyo Thinzar Aung on 12/13/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController , UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate {
    
    var searchController : UISearchController!
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchController = UISearchController(searchResultsController:  nil)
        
        self.searchController.searchResultsUpdater = self
        self.searchController.delegate = self
        self.searchController.searchBar.delegate = self
        
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.dimsBackgroundDuringPresentation = true
        
        self.navigationItem.titleView = searchController.searchBar
        
        self.definesPresentationContext = true
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
