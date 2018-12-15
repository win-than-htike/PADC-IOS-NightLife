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
    
}
