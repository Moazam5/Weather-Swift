//
//  WeatherManager.swift
//  Weather-App
//
//  Created by Moazam Mir on 1/21/21.
//

import Foundation
import CoreLocation



struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=8bd0eccc296b6a82285602877181b0a9&units=metric"
    
    
    func fetchCurrentWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
        performCurrentWeatherRequest(with: urlString)
    }
    
    func fetchCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performCurrentWeatherRequest(with: urlString)
    }
    
    func performCurrentWeatherRequest(with urlString: String) {
        print("url string is ", urlString)
        let url  = URL(string: "https://api.openweathermap.org/data/2.5/weather?appid=8bd0eccc296b6a82285602877181b0a9&units=metric&q=London")
        print(url)
//        var request = URLRequest(url: url)
//
//        let session = URLSession.shared
//        let task = session.dataTask(with: request) { (data, response, error) in
//
//            print(response)
//        }
//
        
        if let url = URL(string: urlString) {
            print("hi")
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print("Error fetching weather data")
                    return
                }
                print("number 1")
                
                if let safeData = data {
                    print("Number 2")
                    if let weather = self.parseCurrentWeatherJSON(safeData) {
                        print("Yo")
                    }
                }
            }
            task.resume()
        } else{
            print("didnt work")
        }
    }
    
    func parseCurrentWeatherJSON(_ weatherData: Data) -> CurrentWeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CurrentWeather.self, from: weatherData)
            print("Decoded data",decodedData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = CurrentWeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather
            
        } catch {
            return nil
        }
    }
    
    
    
}


