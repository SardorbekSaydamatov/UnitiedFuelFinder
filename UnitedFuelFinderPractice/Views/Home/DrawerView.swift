//
//  DrawerView.swift
//  UnitedFuelFinderPractice
//
//  Created by Sardorbek Saydamatov on 27/12/23.
//

import SwiftUI

struct DrawerView: View {
    @ObservedObject var stationViewModel = StationsViewModel()
    @State var isStationOpen: Bool = false
    @State var selectedId: String = ""
    var body: some View {
        VStack {
            topView
            
            middleView
            
            stationView
                .padding(.top, Padding.small)
        }
        .navigationDestination(isPresented: $isStationOpen) {
            StationDetailsView(stationId: selectedId)
        }
    }
    
    private var topView: some View {
        HStack {
            Button(action: {
                
            }, label: {
                HStack {
                    Image("circle")
                    Text("Fair Lawn, Peterson, USA")
                        .font(.system(size: 13, weight: .regular))
                }
                .foregroundStyle(Color.init(uiColor: .label))
            })
            Spacer()
            Divider()
                .frame(width: 1, height: 20)
                .background(Color.gray.opacity(0.4))
            
            Button(action: {
                
            }, label: {
                Image(systemName: "arrow.right")
            })
            .foregroundStyle(Color.init(uiColor: .label))
        }
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .padding(.horizontal)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(5)
        .padding(.horizontal)
    }
        
    private var middleView: some View {
        HStack {
            HStack {
                Button(action: {
                    
                }, label: {
                    HStack {
                        Image("pin")
                        Text("Choose destination")
                            .font(.system(size: 13, weight: .regular))
                    }
                })
                Spacer()
                Divider()
                    .frame(height: 20)
                Button(action: {
                    
                }, label: {
                    Image(systemName: "arrow.right")
                })
            }
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .padding(.horizontal)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(5)
            .padding(.leading)
            
            Button(action: {
                
            }, label: {
                Text("Map")
                    .font(.system(size: 13, weight: .regular))
            })
            .frame(width:60, height: 50)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(5)
            .padding(.trailing, 15)
        }
        .foregroundStyle(Color.init(uiColor: .label))
    }
    
    private var stationView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(stationViewModel.stations) { station in
                    VStack(alignment: .leading, spacing: 0) {
                        HStack {
                            Image("logo")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 44.36741638183594, height: 32)
                                .clipped()
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("TA/Petro")
                                    .font(Font.custom("SF Compact", size: 12))
                                Text("23.37 ml • NEWARK NJ")
                                    .font(Font.custom("SF Compact", size: 12))
                                    .foregroundStyle(Color.gray)
                            }
                            
                            Spacer()
                            
                            Text("$\(station.price)")
                                .font(
                                    Font.custom("SF Compact", size: 12)
                                        .weight(.medium)
                                )
                                .foregroundStyle(Color.orange)
                        }
                        .padding()
                        
                       // Spacer()
                        
                        HStack {
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Save \(Text("$\(station.discount)").foregroundStyle(Color.orange)) per galon")
                                    .font(Font.custom("SF Compact", size: 12))
                                Text("Retail price \(Text("$12").foregroundStyle(Color.orange))")
                                    .font(Font.custom("SF Compact", size: 12))
                            }
                            Spacer()
                            
                            Button(action: {
                            }, label: {
                                HStack {
                                    Image("target")
                                    Text("Focus")
                                        .font(
                                            Font.custom("SF Compact", size: 12)
                                                .weight(.medium))
                                }
                                .foregroundStyle(Color.white)
                                .frame(width: 90, height: 30)
                                .background(Color.orange.opacity(0.7))
                                .cornerRadius(5)
                            })
                        }
                        .padding()
                    }
                    .padding(.vertical)
                    .overlay(
                        Button(action: {
                            selectedId = station.id
                            isStationOpen = true
                        }) {
                            Color.clear
                        }
                    )
                }
                .frame(width: 360)
                .frame(height: 120)
                .background(Color.gray.opacity(0.1))
                .padding(.horizontal)
                .cornerRadius(25)
            }
        }
    }

}

#Preview {
    DrawerView(selectedId: "dsf")
}
