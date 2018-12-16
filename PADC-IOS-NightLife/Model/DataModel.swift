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
    
    func getPopularPlaces(type: String, success : @escaping ([PlaceVO]) -> Void, failure : @escaping () -> Void) {
        
        NetworkManager.shared.loadPopularPlaces(type: type, success: { (data) in
            
            success(data)
            
        }, failure: {
            failure()
        })
        
    }
    
    func getAllPlaces(success : @escaping ([PlaceVO]) -> Void, failure : @escaping () -> Void) {
        
        NetworkManager.shared.loadAllPlaces(success: { (data) in
            
            success(data)
            
        }, failure: {
            failure()
        })
        
    }
    
    func getSearchPlaces(shopName: String, success : @escaping ([PlaceVO]) -> Void, failure : @escaping () -> Void) {
        
        NetworkManager.shared.loadSearchPlaces(shopName: shopName, success: { (data) in
            
            DispatchQueue.main.async {
                success(data)
            }
            
            
        }, failure: {
            failure()
        })
        
    }
    
}
