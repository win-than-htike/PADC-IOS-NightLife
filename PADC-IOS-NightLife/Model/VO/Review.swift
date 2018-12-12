//
//  Review.swift
//  PADC-IOS-NightLife
//
//  Created by eidoshack on 12/12/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import Foundation
import RealmSwift

class Review: Object {
    
    @objc dynamic var id = ""
    @objc dynamic var username: String = ""
    @objc dynamic var comment: String = ""
    @objc dynamic var rating: Double = 0.0
    @objc dynamic var reviewedTime: Int16 = 0
    
    convenience init(id: String, username: String, comment: String, rating: Double, reviewedTime: Int16) {
        self.init()
        self.id = id
        self.username = username
        self.comment = comment
        self.rating = rating
        self.reviewedTime = reviewedTime
    }
    
}
