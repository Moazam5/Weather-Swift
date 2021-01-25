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
    
    init() {
        fetchWeeklyWeather(lat: "", lon: "")
    }
    
    
    
    
    
//    var json : API {
//        let decoder = JSONDecoder()
//        let url = Bundle.main.url(forResource: "weatherResponse", withExtension: "json")!
//        let data = try! Data(contentsOf: url)
//        return  try! decoder.decode(API.self, from: data)
//
//
//
//    }
    
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
    
    
    
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/onecall?"
    let apiKey = "8bd0eccc296b6a82285602877181b0a9"
    
    func fetchWeeklyWeather(lat : String , lon : String)
    {
        let  weeklyURL = "https://api.openweathermap.org/data/2.5/forecast?lat=35&lon=139"
        let urlString = "\(weeklyURL)&appid=\(apiKey)&units=imperial"
        print(urlString)
        performWeeklyRequest(with: urlString)
    }
    
    func performWeeklyRequest(with urlString: String)
    {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                guard let safeData = data , error == nil  else
                {
                    print("Error retreiving data from open weather map")
                    print(response)
                    return
                }
                let decoder = JSONDecoder()
                do
                {
                    let decodedData = try decoder.decode(WeeklyDataModel.self, from: safeData)
                    self.weeklyData = decodedData.list
                   // return decodedData
                    print(decodedData)



                }
                catch
                {
                    print("Error decoding data")

                    let j = try! JSONSerialization.jsonObject(with: safeData, options: [])
                    print("this is j",j)
                    return
                }
            }
            task.resume()
        }
        
        
    }
        

    func fetchWeather(lat : String , lon : String)
    {
        let urlString = "\(weatherURL)lat=\(lat)&lon=\(lon)&appid=\(apiKey)&units=imperial"
        print(urlString)
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                guard let safeData = data , error == nil  else
                {
                    print("Error retreiving data from open weather map")
                    return
                }
                let decoder = JSONDecoder()
                do
                {
                    let decodedData = try decoder.decode(API.self, from: safeData)
                 //   print(decodedData)
                    self.currentTemperatureData.temperature = (decodedData.current.formattedTemp)
                    self.currentTemperatureData.currentDate = decodedData.current.formattedDate
                    self.currentTemperatureData.hourly = decodedData.hourly
                    
                  
                }
                catch
                {
                    print("Error decoding data")

                    return
                }
            }
            task.resume()
        }
    }
        
//    func fetchCity()
//    {
//        CLGeocoder().reverseGeocodeLocation(.init(latitude: json.lat, longitude: json.lon)) { (placemarks, error) in
//            
//            let city = placemarks?.first.flatMap {
//                "\($0.locality ?? ""), \($0.administrativeArea ?? "")"
//              
//            } ?? "Error City"
//            self.city = city
//            self.objectWillChange.send(city)
//        }
//    }
    

}
