////
////  OutfitView.swift
////  WeatherWear
////
////  Created by Justin Hui on 2/6/2023.
////
//
//import SwiftUI
//
//struct OutfitView: View {
//
//    //MARK: Stored Properties
//
//    @State var currentDate: Date = Date()
//
//    @State var currentWeather: Weather?
//
//    //MARK: Computed Properties
//    var body: some View {
//        NavigationView{
//
//            VStack{
//
//                if let currentWeather = currentWeather {
//
//                    //Show the date
//                    Text("\(currentDate.formatted(date: .complete, time: .omitted))")
//                        .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
//                        .foregroundColor(.white)
//                        .background(.blue)
//                        .cornerRadius(.infinity)
//                        .font(.title3)
//
//                    //Show humidity and precipitation
//                    HStack{
//                        Text("\(currentWeather.description) 😎")
//                            .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
//                            .foregroundColor(.white)
//                            .background(.blue)
//                            .cornerRadius(.infinity)
//                        Text("Wind Speed: \(currentWeather.wind)")
//                            .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
//                            .foregroundColor(.white)
//                            .background(.blue)
//                            .cornerRadius(.infinity)
//                    }
//
//                    Spacer()
//
//                    //Show the outfit items and temperature
//                    HStack{
//                        Image(systemName: "sun.max")
//                            .padding()
//
//                        Text(currentWeather.temperature)
//                            .padding()
//                    }
//                    .bold()
//                    .font(.largeTitle)
//
//                    HStack{
//
//                        VStack{
//                            Text("Item 1")
//                                .padding()
//
//                            Text("Item 2")
//                                .padding()
//
//                            Text("Item 3")
//                                .padding()
//                        }
//
//                        VStack{
//                            Text("Item 4")
//                                .padding()
//
//                            Text("Item 5")
//                                .padding()
//
//                        }
//
//                    }
//                    .padding()
//                    .font(.largeTitle)
//                    .border(Color.black)
//
//                    Spacer()
//
//                    Button(action: {
//
//                    }, label: {
//                        Text("Back To Home")
//                            .padding()
//                            .foregroundColor(Color.white)
//                            .background(Color.blue)
//                            .cornerRadius(8)
//                            .font(.title2)
//                    })
//
//                    Spacer()
//
//                }else{
//                    ProgressView()
//                }
//
//            }
//
//            .navigationTitle("Outfit")
//        }
//
//        //Perform asynchronos task when view loads
//        .task {
//            currentWeather = await NetworkService.fetch()
//        }
//    }
//}
//
//struct OutfitView_Previews: PreviewProvider {
//    static var previews: some View {
//        OutfitView()
//    }
//}
