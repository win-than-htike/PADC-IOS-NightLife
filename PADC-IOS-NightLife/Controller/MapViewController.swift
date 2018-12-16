//
//  MapViewController.swift
//  PADC-IOS-NightLife
//
//  Created by eidoshack on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {

    @IBOutlet weak var back: UIBarButtonItem!
    
    var shopRoute : String?
    var shopName : String?
    var tsp : String?
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        
        var lat = 16.780150     // default lat
        var long = 96.168384    // default long
        
        let latLongArr = shopRoute!.split{$0 == ","}.map(String.init)
        if latLongArr.count == 2 {
            lat = Double(latLongArr[0])!
            long = Double(latLongArr[1].trimmingCharacters(in: NSCharacterSet.whitespaces))!
        }
        
        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: long, zoom: 18.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: lat, longitude: long)
        marker.title = shopName
        marker.snippet = tsp
        marker.map = mapView
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}
