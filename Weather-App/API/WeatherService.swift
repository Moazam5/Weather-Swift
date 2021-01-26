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
    //use weather service as singleton
    static let shared = WeatherService()
    
    var objectWillChange: PassthroughSubject<String,Never> = .init()
    @Published var currTempData = CurrentWeatherModel(temperature: "40", city: "New York, NY", currentDate: "Mon 25, Jan", iconName: "cloud", hourly: [], id: 200)
    var weeklyData : [Day] = []
    let apiKey = "8bd0eccc296b6a82285602877181b0a9"
    
    
    init() {
        fetchWeatherData(lat: "40.7128", lon: "-74.006", weekly: true)
        fetchWeatherData(lat: "40.7128", lon: "-74.006", weekly: false)
    }
    

   //Mark:- Fetching data from API
    func fetchWeatherData(lat : String , lon : String, weekly : Bool)
    {
        let weeklyURL = "https://api.openweathermap.org/data/2.5/forecast?"
        let currentURL = "https://api.openweathermap.org/data/2.5/onecall?"
        let requestURL = weekly ? weeklyURL : currentURL
        let urlString = "\(requestURL)lat=\(lat)&lon=\(lon)&appid=\(apiKey)&units=imperial"
        print(urlString)
        performRequest(with: urlString, weekly: weekly)
    }
    
    func performRequest(with urlString: String, weekly : Bool)
    {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                //check for response
              
                guard let safeData = data , error == nil  else
                {
                    print("Error fetching data")
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
    //Method to update currTempData object
    func updateCurrentData(with safeData : Data){
        let decoder = JSONDecoder()
        do
        {
            let decodedData = try decoder.decode(API.self, from: safeData)
            self.currTempData.temperature = (decodedData.current.formattedTemp)
            self.currTempData.currentDate = decodedData.current.formattedDate
            self.currTempData.hourly = decodedData.hourly
            self.currTempData.id = decodedData.current.weather.first?.id ?? 200
            print(currTempData.temperature)
        }
        catch
        {
            print("Error converting to model")
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
    
}
