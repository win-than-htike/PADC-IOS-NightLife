//
//  EventsDetailViewControlerViewController.swift
//  PADC-IOS-NightLife
//
//  Created by eidoshack on 12/12/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

class EventsDetailViewControlerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let navController = navigationController {
            System.clearNavigationBar(forBar: navController.navigationBar)
            navController.view.backgroundColor = .clear
        }
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
