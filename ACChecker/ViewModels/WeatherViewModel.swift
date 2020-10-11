//
//  WeatherViewModel.swift
//  ACChecker
//
//  Created by Abdelrahman Alsaidi on 11/10/2020.
//

import Foundation

class WeatherViewModel : NSObject {
    
    private var weatherAPIService = WeatherAPIService()
    
    func getWeatherDataFor(required_city: String, completion : @escaping (WeatherData) -> ()){
        self.weatherAPIService.getWeatherInfo(required_city: required_city, completion: { (weatherData) in
            completion(weatherData)
        })
    }
}
