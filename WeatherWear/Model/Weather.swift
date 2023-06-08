//
//  Weather.swift
//  WeatherWear
//
//  Created by Justin Hui on 3/6/2023.
//

import Blackbird
import Foundation

struct Weather: Codable {
    var temperature: String
    let wind: String
    let description: String
}

struct Activity: BlackbirdModel {
    @BlackbirdColumn var id: Int
    @BlackbirdColumn var name: String
    @BlackbirdColumn var temp_low: Int
    @BlackbirdColumn var temp_high: Int
}


let exampleWeather = Weather(temperature: "19", wind: "28 km/h", description: "Sunny")

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
    ,
    "Moderate rain" : "cloud.rain"

    
]
