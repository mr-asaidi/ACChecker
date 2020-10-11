//
//  WeatherAPIService.swift
//  ACChecker
//
//  Created by Abdelrahman Alsaidi on 11/10/2020.
//

import Foundation
import Alamofire

class WeatherAPIService: NSObject {
    
    func getWeatherInfo(required_city: String, completion : @escaping (WeatherData) -> ()){
        
        guard let url = URL(string: Constants.API_URL + "?q=" + required_city + "&appid="+Constants.API_KEY+"&units=metric") else { return }
        
        AF.request(url).responseDecodable(of: WeatherData.self) { response in
            if let weatherData = response.value {
                completion(weatherData)
            }
        }
        
    }
}
