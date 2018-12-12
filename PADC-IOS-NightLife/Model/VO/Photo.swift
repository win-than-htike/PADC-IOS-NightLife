//
//  Photo.swift
//  PADC-IOS-NightLife
//
//  Created by eidoshack on 12/12/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import Foundation
import RealmSwift

class Photo: Object {
    
    @objc dynamic var id = ""
    @objc dynamic var name: String = ""
    @objc dynamic var url: String = ""
    @objc dynamic var type: String = ""
    @objc dynamic var uploadTime: String = ""
    @objc dynamic var uploadBy: String = ""
    
    convenience init(id: String, name: String, url: String, type: String, uploadTime: String, uploadBy: String) {
        self.init()
        self.id = id
        self.name = name
        self.url = url
        self.type = type
        self.uploadTime = uploadTime
        self.uploadBy = uploadBy
    }
    
}
