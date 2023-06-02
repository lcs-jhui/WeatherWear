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
