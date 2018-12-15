//
//  RestaurantDetailViewController.swift
//  PADC-IOS-NightLife
//
//  Created by Phyo Thinzar Aung on 12/10/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var imgShop: UIImageView!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblShopName: UILabel!
    @IBOutlet weak var lblShopType: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblOpeningHours: UILabel!
    @IBOutlet weak var lblPhoneNumber: UILabel!
    @IBOutlet weak var lblwebsite: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    
    var shop : PlaceVO? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgShop.sd_setImage(with: URL(string: (shop?.shopImage)!), placeholderImage: UIImage(named: "no-image"))
        lblShopName.text = shop?.shopName
        lblRating.text = shop?.rating
        lblShopName.text = shop?.shopName
        if (!isOpening(openingHours: (shop?.shopTime)!)) {
            let astrMessage = NSMutableAttributedString(string: "Close Now")
            
            //set some attributes
            astrMessage.addAttribute(NSAttributedString.Key.backgroundColor,
                                     value: UIColor.red,
                                     range: NSRange(location: 0, length: 9))
            lblStatus.attributedText = astrMessage
        }
        //status
        lblOpeningHours.text = shop?.shopTime
        lblPhoneNumber.text = shop?.shopPhoneNumber
        lblwebsite.text = "Not Available"
        lblAddress.text = shop?.shopAddress
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func showOnMap(_ sender: Any) {
        let navigationController = UIStoryboard(name: "Map", bundle: nil).instantiateViewController(withIdentifier: "MapViewController") as! UINavigationController
        self.present(navigationController, animated: true, completion: nil)
    }
    
    func isOpening(openingHours: String) -> Bool {
        let fullHourArr = openingHours.split{$0 == " "}.map(String.init)
        
        let current = NSCalendar.current
        let hour = current.component(.hour, from: NSDate() as Date)
        let minute = current.component(.minute, from: NSDate() as Date)
        
        let openHourArr = fullHourArr[0].split{$0 == ":"}.map(String.init)
        let closeHourArr = fullHourArr[3].split{$0 == ":"}.map(String.init)
        
        if ((hour >= Int(openHourArr[0])! && hour <= Int(closeHourArr[0])!)
            && (minute >= Int(openHourArr[1])! && minute <= Int(closeHourArr[1])!)) {
            return true
        }
        
        return false
    }
}
