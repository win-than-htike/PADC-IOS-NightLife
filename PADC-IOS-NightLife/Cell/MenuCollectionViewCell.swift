//
//  MenuCollectionViewCell.swift
//  PADC-IOS-NightLife
//
//  Created by Phyo Thinzar Aung on 12/3/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgMenu: UIImageView!
    @IBOutlet weak var lblMenu: UILabel!
    
    func setMenu(menu: MenuModel) {
        
        self.lblMenu.text = menu.title
        self.imgMenu.image = menu.icon
    }
}
