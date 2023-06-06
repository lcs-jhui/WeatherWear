//
//  WeatherWearApp.swift
//  WeatherWear
//
//  Created by Justin Hui on 2/6/2023.
//
import Blackbird
import SwiftUI

@main
struct WeatherWearApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
            //make database avaiable to all other views through environment
                .environment(\.blackbirdDatabase, AppDatabase.instance)
        }
    }
}
