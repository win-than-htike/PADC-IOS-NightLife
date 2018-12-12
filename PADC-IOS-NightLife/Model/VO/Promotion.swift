//
//  Promotion.swift
//  PADC-IOS-NightLife
//
//  Created by eidoshack on 12/12/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import Foundation
import RealmSwift

class Promotion: Object {
    
    @objc dynamic var id = ""
    @objc dynamic var shopId: String = ""
    @objc dynamic var promotionRate: String = ""
    @objc dynamic var desc: String = ""
    
    convenience init(id: String, shopId: String, promotionRate: String, desc: String) {
        self.init()
        self.id = id
        self.shopId = shopId
        self.promotionRate = promotionRate
        self.desc = desc
    }
    
}
