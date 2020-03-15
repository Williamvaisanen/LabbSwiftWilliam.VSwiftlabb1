//
//  ApiREQ.swift
//  LabbSwiftWilliam.V
//
//  Created by William Väisänen on 2020-02-21.
//  Copyright © 2020 William Väisänen. All rights reserved.
//

import Foundation
import UIKit
//import PlaygroundSupport





func ApiRequest(searchedCity: String, completionHandler: @escaping (WeatherData) -> Void) {
let main = "https://api.openweathermap.org/data/2.5/weather?q="
     let CityApi = "&appid=db8e84c7fb20ea8ef7eeb82aa5ca01b5"

  let allUrl = main + searchedCity + CityApi
    
    let url = URL(string: allUrl)!
    
  

  let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
    if let error = error {
      print("Error: \(error)")
      return
    }
    
    guard let httpResponse = response as? HTTPURLResponse,
          (200...299).contains(httpResponse.statusCode) else {
      //print("Error with the response, unexpected status code: \(response)")
      return
    }


    do {
        let data = data
        let weatherData: WeatherData = try JSONDecoder().decode(WeatherData.self, from: data!)
      print("City name: \(String(describing: weatherData.name))")
        print("Json decoded")
           DispatchQueue.main.async {
    completionHandler(weatherData)
        }
    
        
    } catch {
        
        print("Error!(catch)")
        
    }
   
  })
  task.resume()
}


