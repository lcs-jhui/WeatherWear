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
    
    //Access the connection to the database
    @Environment(\.blackbirdDatabase) var db: Blackbird.Database?

    //The list of activities for the weather
    @BlackbirdLiveModels({ db in
        try await Activity.read(from: db)
    }) var activites
    
    var body: some View {

        //A list of the activities
        List{
            
            ForEach (activites.results) { currentActivity in
                
                Text(currentActivity.name)
                    .font(.title3)
                
            }
        }
        .listStyle(.inset)
        .border(.black)
        .padding(.horizontal)
        
    }
}

struct SuitableActivitiesView_Previews: PreviewProvider {
    static var previews: some View {
        SuitableActivitiesView()
        //Make the database avaiable to this view in Xcode previews
        .environment(\.blackbirdDatabase, AppDatabase.instance)
    }
}
