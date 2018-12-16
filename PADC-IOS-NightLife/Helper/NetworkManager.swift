//
//  NetworkManager.swift
//  PADC-IOS-NightLife
//
//  Created by eidoshack on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
import FirebaseStorage

class NetworkManager {
    
    let rootRef : DatabaseReference!
    
    private init() {
        rootRef = Database.database().reference()
    }
    
    static var shared : NetworkManager =  {
        return sharedNetworkManager
    }()
    
    private static var sharedNetworkManager: NetworkManager = {
        let networkManager = NetworkManager()
        return networkManager
    }()
    
    func loadPlaces(type: String, success : @escaping ([PlaceVO]) -> Void, failure : @escaping () -> Void) {
        
        rootRef.child("places").queryOrdered(byChild: "shopType").queryEqual(toValue: type).observe(.value) { (dataSnapshot) in
            
            if let places = dataSnapshot.children.allObjects as? [DataSnapshot] {
                
                var placeList : [PlaceVO] = []
                
                for place in places {
                    
                    if let value = place.value as? [String : AnyObject] {
                        
                        placeList.append(PlaceVO.parseToPlaceVO(json: value))
                        
                    }
                    
                }
                
                success(placeList)
                
            }
            
        }
        
    }
    
    func loadPopularPlaces(type: String, success : @escaping ([PlaceVO]) -> Void, failure : @escaping () -> Void) {
        
        rootRef.child("places").queryOrdered(byChild: "shopType")
                               .queryEqual(toValue: type)
                               .observe(.value) { (dataSnapshot) in
            
            if let places = dataSnapshot.children.allObjects as? [DataSnapshot] {
                
                var placeList : [PlaceVO] = []
                
                for place in places {
                    
                    if let value = place.value as? [String : AnyObject] {
                        
                        let placeVO = PlaceVO.parseToPlaceVO(json: value)
                        
                        if (Double(placeVO.rating)! >= 4.5) {
                        
                            placeList.append(placeVO)
                            
                        }
                        
                    }
                    
                }
                
                success(placeList)
                
            }
            
        }
        
    }
    
    func loadAllPlaces(success : @escaping ([PlaceVO]) -> Void, failure : @escaping () -> Void) {
        
        rootRef.child("places").observe(.value) { (dataSnapshot) in
            
            if let places = dataSnapshot.children.allObjects as? [DataSnapshot] {
                
                var placeList : [PlaceVO] = []
                
                for place in places {
                    
                    if let value = place.value as? [String : AnyObject] {
                        
                        placeList.append(PlaceVO.parseToPlaceVO(json: value))
                        
                    }
                    
                }
                
                success(placeList)
                
            }
            
        }
        
    }
    
    func loadSearchPlaces(shopName: String, success : @escaping ([PlaceVO]) -> Void, failure : @escaping () -> Void) {
        
        rootRef.child("places").queryOrdered(byChild: "shopName")
                               .queryStarting(atValue: shopName).observe(.value) { (dataSnapshot) in
            
            if let places = dataSnapshot.children.allObjects as? [DataSnapshot] {
                
                var placeList : [PlaceVO] = []
                
                for place in places {
                    
                    if let value = place.value as? [String : AnyObject] {
                        
                        placeList.append(PlaceVO.parseToPlaceVO(json: value))
                        
                    }
                    
                }
                
                success(placeList)
                
            }
            
        }
        
    }
    
}
