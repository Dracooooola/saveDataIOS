//
//  AlamofireLoading.swift
//  ClientServerStart
//
//  Created by Владислав Климов on 25.01.2020.
//  Copyright © 2020 Владислав Климов. All rights reserved.
//

import Foundation
import Alamofire
//completion: @escaping ([Date : Weather]) -> Void
class AlamofireLoading {
    func loadWeatherForecast(completition: @escaping ([Weather]) -> Void){
        Alamofire.request("http://api.openweathermap.org/data/2.5/forecast?q=Moscow&lang=ru&units=metric&APPID=e56789f7cfb2f4a591b2a1c598d98a9c").responseJSON{
            response in
            if let objects = response.result.value, let jsonDict = objects as? NSDictionary  {
                var forecast: [Weather] = []
                let forecastArray = jsonDict["list"] as! [[String : Any]]
                for data in forecastArray {
                    let mainData = data["main"] as! NSDictionary
                    let temp = mainData["temp"] as! Double
                    let weatherData = data["weather"] as! [[String : Any]]
                    let overcast = String(describing: weatherData[0]["description"]!)
                    let date = Date.init(timeIntervalSince1970: Double(String(describing: data["dt"]!))!)
                    
                    let weather = Weather(temp: temp, date: date, overcast: overcast)
                    forecast.append(weather)
                }
                DispatchQueue.main.async {
                    completition(forecast)
                }
            }
        }
        
    }
    
}

