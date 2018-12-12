//
//  Shop.swift
//  PADC-IOS-NightLife
//
//  Created by eidoshack on 12/12/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import Foundation
import RealmSwift

class Shop: Object {
    
    @objc dynamic var id = ""
    @objc dynamic var name: String = ""
    @objc dynamic var owner: String = ""
    @objc dynamic var address: String = ""
    @objc dynamic var phone: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var lat: Double = 0.0
    @objc dynamic var long: Double = 0.0
    @objc dynamic var rating: Double = 0.0
    @objc dynamic var reviews: [Review] = []
    @objc dynamic var openHour: String = ""
    @objc dynamic var closeHour: String = ""
    @objc dynamic var peakTimes: [Peak] = []
    @objc dynamic var happyHour: String = ""
    @objc dynamic var type: Int = 0
    @objc dynamic var coverPhotos: [Photo] = []
    @objc dynamic var galleris: [Photo] = []
    
    convenience init(id: String, name: String, owner: String, address: String, phone: String,
                     email: String, lat: Double, long: Double, rating: Double, reviews: [Review],
                     openHour: String, closeHour: String, peakTimes: [Peak], happyHour: String,
                     type: Int, coverPhotos: [Photo], galleris: [Photo]) {
        self.init()
        self.id = id
        self.name = name
        self.owner = owner
        self.address = address
        self.phone = phone
        self.email = email
        self.lat = lat
        self.long = long
        self.rating = rating
        self.reviews = reviews
        self.openHour = openHour
        self.closeHour = closeHour
        self.peakTimes = peakTimes
        self.happyHour = happyHour
        self.type = type
        self.coverPhotos = coverPhotos
        self.galleris = galleris
    }
}
