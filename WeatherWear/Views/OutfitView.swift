//
//  OutfitView.swift
//  WeatherWear
//
//  Created by Justin Hui on 2/6/2023.
//

import SwiftUI

struct OutfitView: View {
    var body: some View {
        NavigationView{
            
            VStack{
                
                //Show the date
                Text("Monday, 29th May")
                    .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(.infinity)
                    .font(.title3)
                
                HStack{
                    Text("Humidity: 44%")
                        .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(.infinity)
                    Text("Precipitation: 0mm")
                        .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(.infinity)
                }
                
            }
            
            .navigationTitle("Outfit")
        }
    }
}

struct OutfitView_Previews: PreviewProvider {
    static var previews: some View {
        OutfitView()
    }
}
