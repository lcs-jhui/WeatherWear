//
//  OutfitView.swift
//  WeatherWear
//
//  Created by Justin Hui on 2/6/2023.
//

import Blackbird
import SwiftUI

struct OutfitView: View {

    //MARK: Stored Properties
    
    //Access the connection to the database
    @Environment(\.blackbirdDatabase) var db: Blackbird.Database?

    //Needed to show the date
    @State var currentDate: Date = Date()

    //Weather to show
    var weatherToShow: Weather
    
    //The list of activities for the weather
    @BlackbirdLiveModels({ db in
        try await Activity.read(from: db)
    }) var activites
    
    //MARK: Computed Properties
    var body: some View {
        NavigationView{

            VStack{


                    //Show the date
                    Text("\(currentDate.formatted(date: .complete, time: .omitted))")
                        .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
                        .foregroundColor(.white)
                        .background(Color("MainColor"))
                        .cornerRadius(.infinity)
                        .font(.title3)

                    //Show humidity and precipitation
                    HStack{
                        
                        HStack{
                            
                            //Show the icon of the weather descirption
                            if let icon = weatherIcons[weatherToShow.description] {
                                
                                Image(systemName: icon)
                                    
                            } else {
                                Image(systemName: "questionmark.square.dashed")
                            }
                            
                            Text(weatherToShow.description)
                            
                        }
                        .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
                        .foregroundColor(.white)
                        .background(Color("MainColor"))
                        .cornerRadius(.infinity)
                        
                        //Show the wind speed
                        Text("Wind Speed: \(weatherToShow.wind)")
                            .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
                            .foregroundColor(.white)
                            .background(Color("MainColor"))
                            .cornerRadius(.infinity)
                    }

                    Spacer()
                
                //Show temperature
                HStack{
                    if let icon = weatherIcons[weatherToShow.description] {
                        
                        Image(systemName: icon)
                            
                    } else {
                        Image(systemName: "questionmark.square.dashed")
                    }

                    Text(weatherToShow.temperature)
                        .padding()
                }
                .bold()
                .font(.largeTitle)
                
                    Spacer()
                
                //Title
                Text("Activities To Do")
                    .font(.largeTitle)
                
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
                
                Spacer()
                
            }
        }
    }
}

struct OutfitView_Previews: PreviewProvider {
    static var previews: some View {
        OutfitView(weatherToShow: exampleWeather)
        //Make the database avaiable to this view in Xcode previews
        .environment(\.blackbirdDatabase, AppDatabase.instance)
    }
    
}
