//
//  Weather.swift
//  WeatherWear
//
//  Created by Justin Hui on 3/6/2023.
//

import Foundation

struct Weather: Codable {
    let temperature: String
    let wind: String
    let description: String
}


let exampleWeather = Weather(temperature: "19 ℃", wind: "28 km/h", description: "Sunny")

var weatherIcons = [

    "Sunny" : "sun.max"
    ,
    "Partly cloudy" : "cloud.sun"
    ,
    "Patchy rain possible" : "cloud"
    ,
    "Light rain shower" : "cloud.rain"
    ,
    "Clear" : "sun.min"
    ,
    "Rain with thunderstorm" : "cloud.bolt.rain"
    ,
    "Rain" : "cloud.heavyrain"
    
]
