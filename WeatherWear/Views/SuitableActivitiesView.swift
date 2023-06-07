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
    
    //The list of activities
    @BlackbirdLiveModels var activities: Blackbird.LiveResults<Activity>

    
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
    init(filteredOn temperature: String) {
        
        //Initialize the live model
        _activities = BlackbirdLiveModels ({ db in
            try await Activity.read(from: db, sqlWhere: "temp_low <= \(temperature) AND temp_high >= \(temperature)")
        })
        
    }
}

struct SuitableActivitiesView_Previews: PreviewProvider {
    static var previews: some View {
        SuitableActivitiesView(filteredOn: "19")
        //Make the database avaiable to this view in Xcode previews
            .environment(\.blackbirdDatabase, AppDatabase.instance)
    }
}
