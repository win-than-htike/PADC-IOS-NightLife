//
//  Places.swift
//  PADC-IOS-NightLife
//
//  Created by eidoshack on 12/12/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import Foundation
import RealmSwift

class PlaceVO: Object {
    
    @objc dynamic var _id = ""
    @objc dynamic var shopName: String = ""
    @objc dynamic var shopImage: String = ""
    @objc dynamic var shopReview: String = ""
    @objc dynamic var shopPhoneNumber: String = ""
    @objc dynamic var shopAddress: String = ""
    @objc dynamic var shopTime: String = ""
    @objc dynamic var shopRoute: String = ""
    @objc dynamic var shopCity: String = ""
    @objc dynamic var shopType: String = ""
    @objc dynamic var rating: String = ""
    //@objc dynamic var shopReviewmm: String = ""
    @objc dynamic var tsp: String = ""
    //@objc dynamic var menu: [String] = []
    
    
    convenience init(_id: String, shopName: String, shopImage: String, shopReview: String,
                     shopPhoneNumber: String, shopAddress: String, shopTime: String,
                     shopRoute: String, shopCity: String, shopType: String, rating: String,
                     tsp: String) {
        self.init()
        self._id = _id
        self.shopName = shopName
        self.shopImage = shopImage
        self.shopReview = shopReview
        self.shopPhoneNumber = shopPhoneNumber
        self.shopAddress = shopAddress
        self.shopTime = shopTime
        self.shopRoute = shopRoute
        self.shopCity = shopCity
        self.shopType = shopType
        self.rating = rating
        //self.shopReviewmm = shopReviewmm
        self.tsp = tsp
        //self.menu = menu
    }
    
    public static func parseToPlaceVO (json : [String : AnyObject]) -> PlaceVO {
        
        let place = PlaceVO()
        place._id = json["_id"] as! String
        place.shopName = json["shopName"] as! String
        place.shopImage = json["shopImage"] as! String
        place.shopReview = json["shopReview"] as! String
        place.shopPhoneNumber = json["shopPhoneNumber"] as! String
        if let shopAddress = json["shopAddress"] as? String {
            place.shopAddress = shopAddress
        }
        if let shopTime = json["shopTime"] as? String {
            place.shopTime = shopTime
        }
        if let shopRoute = json["shopRoute"] as? String {
            place.shopRoute = shopRoute
        }
        if let shopCity = json["shopCity"] as? String {
            place.shopCity = shopCity
        }
        if let tsp = json["tsp"] as? String {
            place.tsp = tsp
        }
        place.shopType = json["shopType"] as! String
        place.rating = json["rating"] as! String
        //place.shopReviewmm = json["shopReviewmm"]
        //if let menu = json["menu"]?.array as? [String] {
        //    place.menu = menu
        //}
        return place
        
    }
    
}
