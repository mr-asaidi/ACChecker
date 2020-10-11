//
//  WeatherInfoVC.swift
//  ACChecker
//
//  Created by Abdelrahman Alsaidi on 11/10/2020.
//

import UIKit
import TinyConstraints

class WeatherInfoVC: UIViewController {
    var weather_data: WeatherData!
    
    var allInfo: UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        return stack
    }()
    
    var cityName: UILabel = {
       return MainViews.getLabel(12, textAlignment: .center, textColor: .darkGray)
    }()
    
    var coords: UILabel = {
       return MainViews.getLabel(12, textAlignment: .center, textColor: .darkGray)
    }()
    
    var weather: UILabel = {
       return MainViews.getLabel(12, textAlignment: .center, textColor: .darkGray)
    }()
    
    var temp: UILabel = {
       return MainViews.getLabel(12, textAlignment: .center, textColor: .darkGray)
    }()
    
    
    var humidity: UILabel = {
       return MainViews.getLabel(12, textAlignment: .center, textColor: .darkGray)
    }()
    
    var wind: UILabel = {
       return MainViews.getLabel(12, textAlignment: .center, textColor: .darkGray)
    }()
    
    
    var clouds: UILabel = {
       return MainViews.getLabel(12, textAlignment: .center, textColor: .darkGray)
    }()
    
    
    var country: UILabel = {
       return MainViews.getLabel(12, textAlignment: .center, textColor: .darkGray)
    }()
    
    
    var sunrise: UILabel = {
       return MainViews.getLabel(12, textAlignment: .center, textColor: .darkGray)
    }()
    
    var sunset: UILabel = {
       return MainViews.getLabel(12, textAlignment: .center, textColor: .darkGray)
    }()
    
    
    fileprivate func addSubviewsToStack() {
        allInfo.addArrangedSubview(cityName)
        allInfo.addArrangedSubview(coords)
        allInfo.addArrangedSubview(weather)
        allInfo.addArrangedSubview(temp)
        allInfo.addArrangedSubview(humidity)
        allInfo.addArrangedSubview(wind)
        allInfo.addArrangedSubview(clouds)
        allInfo.addArrangedSubview(country)
        allInfo.addArrangedSubview(sunrise)
        allInfo.addArrangedSubview(sunset)
        
    }
    
    fileprivate func fillWeatherInfo() {
        cityName.text = weather_data.name
        coords.text = "Lat: \(weather_data.coord.lat), Lon: \(weather_data.coord.lon)"
        if (weather_data.weather.count != 0) {
            let first_weather_info:Weather = weather_data.weather[0]
            weather.text = "\(first_weather_info.main) | \(first_weather_info.weatherDescription)"
        }else{
            weather.text = ""
        }
        
        temp.text = "Temp: \(weather_data.main.temp) | Feels Like: \(weather_data.main.feelsLike)"
        humidity.text = "Humidity: \(weather_data.main.humidity) | Pressure: \(weather_data.main.pressure)"
        wind.text = "Wind Speed: \(weather_data.wind.speed) | Deg: \(weather_data.wind.deg)"
        clouds.text = "Clouds: \(weather_data.clouds.all)"
        country.text = "Country: \(weather_data.sys.country)"
        sunrise.text = "Sunrise: \(weather_data.sys.sunrise.parseAsDate())"
        sunset.text = "Sunset: \(weather_data.sys.sunset.parseAsDate())"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(allInfo)
        allInfo.edgesToSuperview()
        allInfo.centerInSuperview()
        
        addSubviewsToStack()
        
        fillWeatherInfo()
        
    }


}
