//
//  HomeView.swift
//  WeatherWear
//
//  Created by Justin Hui on 2/6/2023.
//

import SwiftUI

struct HomeView: View {
    
    //MARK: Stored Properties
    
    //current weather on dispaly
    @State var currentWeather: Weather?
    
    //User can input their location
    @State var location = ""
    
    //MARK: Computed Properties
    
    var body: some View {
        NavigationView{
            
            VStack{
                
                if let currentWeather = currentWeather {
                    
                    //Shows the location
                    HStack{
                        Image(systemName: "location.fill")
                        
                        TextField("Input City Here", text: $location)
                    }
                    .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(.infinity)
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    //A system image of the weather and the degrees in celsius
                    HStack{
                        Image(systemName: "sun.max")
                            .padding()
                        
                        Text("26℃")
                            .padding()
                    }
                    .font(.largeTitle)
                    .bold()
                    
                    Spacer()
                    
                    //Shows the description as well as wind speed
                    HStack{
                        
                        VStack{
                            Text(currentWeather.description)
                            Text("😎")
                        }
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        
                        VStack{
                            Text("Wind Speed:")
                            Text(currentWeather.wind)
                        }
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                    }
                    .font(.title)
                    
                    Spacer()
                    
                    //A picker to select the acitivity user wants to do
                    Picker(selection: .constant(0),
                           label: Text("Activity"),
                           content: {
                        
                        Text("Choose Activity").tag(0)
                        Text("Running").tag(1)
                        Text("Hiking").tag(2)
                        Text("Swimming").tag(3)
                        Text("Casual").tag(4)
                        
                    })
                    .pickerStyle(.wheel)
                    .border(Color.black)
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Generate Recommendation")
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                            .cornerRadius(8)
                            .font(.title2)
                    })
                    
                    Spacer()
                    
                }else{
                    
                    ProgressView()
                    
                }
                
            }
                .navigationTitle("Home")
        }
        //asynchronos task to be performed as the view appears
        .task{
            currentWeather = await NetworkService.fetch()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
