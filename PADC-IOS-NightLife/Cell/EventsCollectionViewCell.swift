//
//  EventsCollectionViewCell.swift
//  PADC-IOS-NightLife
//
//  Created by eidoshack on 12/10/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit
import Cosmos

class EventsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var ivEventCover: UIImageView!
    @IBOutlet weak var lblEventTitle: UILabel!
    @IBOutlet weak var lblEventType: UILabel!
    @IBOutlet weak var rating: CosmosView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
