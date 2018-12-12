//
//  Peak.swift
//  PADC-IOS-NightLife
//
//  Created by eidoshack on 12/12/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import Foundation
import RealmSwift

class Peak: Object {
    
    @objc dynamic var id = ""
    @objc dynamic var shopId: String = ""
    @objc dynamic var peakHour: String = ""
    @objc dynamic var value: Double = 0.0
    
    convenience init(id: String, shopId: String, peakHour: String, value: Double) {
        self.init()
        self.id = id
        self.shopId = shopId
        self.peakHour = peakHour
        self.value = value
    }
    
}
