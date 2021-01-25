//
//  weatherService.swift
//  Weather-App
//
//  Created by Moazam Mir on 1/24/21.
//

import Foundation
import CoreLocation
import Combine
final class WeatherService  : ObservableObject
{
    static let shared = WeatherService()
    
    var objectWillChange: PassthroughSubject<String,Never> = .init()
    @Published var city = "Loading"
    @Published var currentTemperatureData = CurrentWeatherModel(temperature: "40", city: "New York", currentDate: "Mon 25, Jan", iconName: "cloud", hourly: [])
    var weeklyData : [Day] = []
    let apiKey = "8bd0eccc296b6a82285602877181b0a9"
    
    
    init() {

        fetchWeatherData(lat: "40.7128", lon: "-74.006", weekly: true)
        fetchWeatherData(lat: "40.7128", lon: "-74.006", weekly: false)

    }
    

   
    
    
    
    
  
    func fetchWeatherData(lat : String , lon : String, weekly : Bool)
    {
        let  weeklyURL = "https://api.openweathermap.org/data/2.5/forecast?"
        let currentURL = "https://api.openweathermap.org/data/2.5/onecall?"
        let requestURL = weekly ? weeklyURL : currentURL
        let urlString = "\(requestURL)lat=\(lat)&lon=\(lon)&appid=\(apiKey)&units=imperial"
        print(urlString)
        performWeeklyRequest(with: urlString, weekly: weekly)
    }
    
    func performWeeklyRequest(with urlString: String, weekly : Bool)
    {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                guard let safeData = data , error == nil  else
                {
                    print("Error retreiving data from open weather map")
                   // print(response)
                    return
                }
                
                if weekly{
                    self.updateWeeklyData(with: safeData)
                }else{
                    self.updateCurrentData(with: safeData)
                }
            }
            task.resume()
        }
        
    }
    
    func updateCurrentData(with safeData : Data){
        let decoder = JSONDecoder()
        do
        {
            let decodedData = try decoder.decode(API.self, from: safeData)
            self.currentTemperatureData.temperature = (decodedData.current.formattedTemp)
            self.currentTemperatureData.currentDate = decodedData.current.formattedDate
            self.currentTemperatureData.hourly = decodedData.hourly
        }
        catch
        {
            print("Error decoding Current data")
            return
        }
    }
    
    func updateWeeklyData(with safeData: Data)
    {
        let decoder = JSONDecoder()
        do
        {
            let decodedData = try decoder.decode(WeeklyDataModel.self, from: safeData)
            self.weeklyData = decodedData.list
        }
        catch
        {
            print("Error decoding weekly data")
            return
        }
        
    }
        
    struct WeatherSymbol : Codable {
        let icon : String
        let label : String
    }
    
    var icons : [String : WeatherSymbol]
    {
        let decoder = JSONDecoder()
        let url = Bundle.main.url(forResource: "Icons", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        return try! decoder.decode([String : WeatherSymbol].self, from: data)
    }
    
//
//    func fetchWeather(lat : String , lon : String)
//    {
//        let urlString = "\(weatherURL)lat=\(lat)&lon=\(lon)&appid=\(apiKey)&units=imperial"
//        print(urlString)
//        performRequest(with: urlString)
//    }
//
//    func performRequest(with urlString: String) {
//
//        if let url = URL(string: urlString) {
//            let session = URLSession(configuration: .default)
//            let task = session.dataTask(with: url) { (data, response, error) in
//                guard let safeData = data , error == nil  else
//                {
//                    print("Error retreiving data from open weather map")
//                    return
//                }
//                let decoder = JSONDecoder()
//                do
//                {
//                    let decodedData = try decoder.decode(API.self, from: safeData)
//                    print(decodedData)
//                    self.currentTemperatureData.temperature = (decodedData.current.formattedTemp)
//                    self.currentTemperatureData.currentDate = decodedData.current.formattedDate
//                    self.currentTemperatureData.hourly = decodedData.hourly
//                }
//                catch
//                {
//                    print("Error decoding data")
//                    return
//                }
//            }
//            task.resume()
//        }
//    }

}
