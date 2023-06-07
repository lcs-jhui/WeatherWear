//
//  SuitableActivitiesView.swift
//  WeatherWear
//
//  Created by Justin Hui on 6/6/2023.
//

import Blackbird
import SwiftUI

struct SuitableActivitiesView: View {
    
    //MARK: Stored Proeprties
    
    //Needed to query database
    @Environment(\.blackbirdDatabase) var db: Blackbird.Database?
    
    //Weather to show
    var temperatureForWeather: Weather
    
    //The list of activities
    @BlackbirdLiveQuery(tableName: "Activity", { db in
        try await db.query("SELECT name FROM Activity WHERE temp_low <= -10 AND temp_high >= -10")
    }) var activities
    
    var body: some View {
        
        //A list of the activities
        List{
            
            ForEach (activities.results, id: \.self) { currentActivity in
                
                    Text(currentActivity.name)
                        .font(.title3)
            }
        }
        .listStyle(.inset)
        .border(.black)
        .padding(.horizontal)
        
    }
    
    //MARK: Initializer
    
}

struct SuitableActivitiesView_Previews: PreviewProvider {
    static var previews: some View {
        SuitableActivitiesView(temperatureForWeather: exampleWeather)
        //Make the database avaiable to this view in Xcode previews
            .environment(\.blackbirdDatabase, AppDatabase.instance)
    }
}
