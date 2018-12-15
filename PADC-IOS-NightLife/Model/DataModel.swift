//
//  DataModel.swift
//  PADC-IOS-NightLife
//
//  Created by eidoshack on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import Foundation
import FirebaseDatabase

class DataModel {
    private init() {}
    
    static var shared : DataModel =  {
        return sharedDataModel
    }()
    
    private static var sharedDataModel: DataModel = {
        let dataModel = DataModel()
        return dataModel
    }()
    
    var user : PlaceVO? = nil
    
    func getPlaces(type: String, success : @escaping ([PlaceVO]) -> Void, failure : @escaping () -> Void) {
        
        NetworkManager.shared.loadPlaces(type: type, success: { (data) in
            
            success(data)
            
        }, failure: {
            failure()
        })
        
    }
    
}
