//
//  HomeView.swift
//  WeatherWear
//
//  Created by Justin Hui on 2/6/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView{
            
            VStack{
                
                //Shows the location
                HStack{
                    Image(systemName: "location.fill")
                    
                    Text("Lakefield, ON")
                }
                .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(.infinity)
                
                Spacer()
                
                //A system image of the weather and the degrees in celsius
                HStack{
                    Image(systemName: "sun.max")
                        .padding()
                    
                    Text("26℃")
                        .padding()
                }
                .font(.largeTitle)
                
                Spacer()
                
                //Shows the High and Low as well as humidity
                HStack{
                    
                    VStack{
                        Text("Sunny")
                        Text("H: 26 L:13")
                    }
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    
                    VStack{
                        Text("Humidity:")
                        Text("44%")
                    }
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                }
                
                Spacer()
                
                //A picker to select the acitivity user wants to do
                Picker(selection: .constant(0),
                       label: Text("Choose Activity"),
                       content: {
                    Text("Choose Activity").tag(0)
                    Text("Running").tag(1)
                    Text("Walking").tag(2)
                    Text("Swimming").tag(3)
                    Text("Casual").tag(4)
                })
                .pickerStyle(.menu)

                Spacer()
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
