//
//  WeatherRouter.swift
//  ACChecker
//
//  Created by Abdelrahman Alsaidi on 11/10/2020.
//

import Foundation
import UIKit

enum WeatherSegue {
    case beaconReportPage
    case allWeatherData
}

protocol WeatherRouter {
    func perform(_ segue: WeatherSegue, from source: UIViewController, other_data: [String: Any])
}

class DefaultWeatherRouter: WeatherRouter {
    func perform(_ segue: WeatherSegue, from source: UIViewController, other_data: [String: Any]) {
        switch segue {
        case .allWeatherData:
            if let weather_data = other_data["weather_data"] as? WeatherData {
                let vc = DefaultWeatherRouter.makeWeatherInfoVC(weather_data: weather_data)
                source.navigationController?.pushViewController(vc, animated: true)
            }
        default:
            print("shall handle other navigations... ")
        }
    }
    
    static func makeWeatherInfoVC(weather_data: WeatherData) -> WeatherInfoVC {
        let vc = WeatherInfoVC()
        vc.weather_data = weather_data
        return vc
    }

}
