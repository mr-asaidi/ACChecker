//
//  Input.swift
//  ACChecker
//
//  Created by Abdelrahman Alsaidi on 11/10/2020.
//

import Foundation

class Input: NSObject {
    dynamic var current_ac: Double?
    dynamic var required_interval: TimeInterval = 60.0
    dynamic var current_city: String?
    
    convenience init(current_ac: Double?, required_interval: TimeInterval, current_city: String?) {
        self.init()
        self.current_ac = current_ac
        self.required_interval = required_interval
        self.current_city = current_city
    }
}
