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
    
    @State var currentDate: Date = Date()
    
    //MARK: Computed Properties
    var body: some View {
        NavigationView{
            
            VStack{
                
                
                
                //Shows the location
                HStack{
                    Image(systemName: "location.fill")
                    
                    TextField("", text: $location, prompt: Text("Input City Here").foregroundColor(.white))
                    
                    Button(action: {
                        
                        Task {
                            currentWeather = await NetworkService.fetch(forLocation: location)
                        }
                        
                    }, label: {
                        Text("Enter")
                    })
                    .buttonStyle(.borderedProminent)
                    .tint(.green)
                    .cornerRadius(.infinity)
                    
                }
                .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                .foregroundColor(.white)
                .background(Color("MainColor"))
                .cornerRadius(.infinity)
                .padding(.horizontal)
                
                
                
                Spacer()
                
                if let currentWeather = currentWeather {
                    
                    
                    //Show the date
                    Text("\(currentDate.formatted(date: .complete, time: .omitted))")
                        .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
                        .foregroundColor(.white)
                        .background(Color("MainColor"))
                        .cornerRadius(.infinity)
                        .font(.title3)
                    
                    Spacer()
                    
                    //A system image of the weather and the degrees in celsius
                    Text(currentWeather.temperature)
                        .padding()
                        .font(.largeTitle)
                        .bold()
                    
                    Spacer()
                    
                    //Shows the description as well as wind speed
                    HStack{
                        
                        VStack{
                            Text(currentWeather.description)
                            Image(systemName: "sun.max")
                        }
                        .padding()
                        .background(Color("MainColor"))
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .font(.title2)
                        
                        VStack{
                            Text("Wind Speed:")
                            Text(currentWeather.wind)
                        }
                        .padding()
                        .background(Color("MainColor"))
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .font(.title2)
                    }
                    .font(.title)
                    
                    Spacer()
                    
                    //                    //A picker to select the acitivity user wants to do
                    //                    Picker(selection: .constant(0),
                    //                           label: Text("Activity"),
                    //                           content: {
                    //
                    //                        Text("Choose Activity").tag(0)
                    //                        Text("Running").tag(1)
                    //                        Text("Hiking").tag(2)
                    //                        Text("Swimming").tag(3)
                    //                        Text("Casual").tag(4)
                    //
                    //                    })
                    //                    .pickerStyle(.wheel)
                    //                    .border(Color.black)
                    //                    .padding(.horizontal)
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        OutfitView(weatherToShow: currentWeather)
                    }, label: {
                        Text("Suggest Activites")
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color.green)
                            .cornerRadius(8)
                            .font(.title2)
                    })
                    
                    Spacer()
                    
                }else{
                    
                    Text("Please Provide Valid Location")
                    Spacer()
                    
                }
                
            }
            .navigationTitle("Home")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
