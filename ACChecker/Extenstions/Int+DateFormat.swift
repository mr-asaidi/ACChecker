//
//  Int+DateFormat.swift
//  ACChecker
//
//  Created by Abdelrahman Alsaidi on 11/10/2020.
//

import Foundation


extension Int {
    
    func parseAsDate() -> String{
        if self > 0 {
            let date = Date(timeIntervalSince1970: TimeInterval(self))
            let dateFormatter = DateFormatter()
            dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
            dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
            dateFormatter.timeZone = .current
            let localDate = dateFormatter.string(from: date)
            return localDate
        }
        return ""
    }
}
