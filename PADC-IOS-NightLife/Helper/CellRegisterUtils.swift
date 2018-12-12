//
//  CellRegisterUtils.swift
//  PADC-IOS-NightLife
//
//  Created by eidoshack on 12/10/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import Foundation
import UIKit

class CellRegisterUtils {
    
    static func cellRegister(nibName: String, collectionView: UICollectionView) {
        let nib = UINib(nibName: nibName, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: nibName)
    }
    
}
