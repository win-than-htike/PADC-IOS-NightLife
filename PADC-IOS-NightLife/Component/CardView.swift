//
//  CardView.swift
//  PADC-IOS-NightLife
//
//  Created by Phyo Thinzar Aung on 12/3/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

@IBDesignable
class CardView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 2
    
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 3
    
    @IBInspectable var shadowColor: UIColor? = UIColor(red:0.67, green:0.67, blue:0.67, alpha:1.0)
    @IBInspectable var shadowOpacity: Float = 0.5
    
    override func layoutSubviews() {
        
        layer.backgroundColor = UIColor.white.cgColor
        layer.cornerRadius = cornerRadius
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        
        layer.masksToBounds = false
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
    }
    
}

