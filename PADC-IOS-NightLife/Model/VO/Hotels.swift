//
//  Hotels.swift
//  PADC-IOS-NightLife
//
//  Created by eidoshack on 12/12/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import Foundation
import RealmSwift

class Hotels: Object {
    
    @objc dynamic var _id = ""
    @objc dynamic var shopName: String = ""
    @objc dynamic var shopImage: String = ""
    @objc dynamic var shopReview: String = ""
    @objc dynamic var shopPhoneNumber: String = ""
    @objc dynamic var shopAddress: String = ""
    @objc dynamic var shopCity: String = ""
    @objc dynamic var shopType: String = ""
    @objc dynamic var Rating: String = ""
    @objc dynamic var tsp: String = ""
    
    convenience init(_id: String, shopName: String, shopImage: String, shopReview: String,
                     shopPhoneNumber: String, shopAddress: String, shopCity: String,
                     shopType: String, Rating: String, tsp: String) {
        self.init()
        self._id = _id
        self.shopName = shopName
        self.shopImage = shopImage
        self.shopReview = shopReview
        self.shopPhoneNumber = shopPhoneNumber
        self.shopAddress = shopAddress
        self.shopCity = shopCity
        self.shopType = shopType
        self.Rating = Rating
        self.tsp = tsp
    }
    
}
