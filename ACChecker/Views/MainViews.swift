//
//  MainViews.swift
//  ACChecker
//
//  Created by Abdelrahman Alsaidi on 11/10/2020.
//

import Foundation
import UIKit


class MainViews {
    
    internal static func getLabel(_ size:CGFloat, textAlignment: NSTextAlignment, textColor: UIColor? = nil, cornerRadius:CGFloat = 0) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: size)
        label.textAlignment = textAlignment
        label.numberOfLines = 0
        label.textColor = textColor
        if cornerRadius != 0 {
            label.layer.cornerRadius = cornerRadius
        }
        return label
    }
    
}
