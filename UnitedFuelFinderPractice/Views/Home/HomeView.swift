//
//  MainView.swift
//  UnitedFuelFinderPractice
//
//  Created by Sardorbek Saydamatov on 26/12/23.
//

import SwiftUI

struct HomeView: View {
    @State var settingsOpen: Bool = false
    var body: some View {
       
            ZStack{
                mapView
            }
            .navigationDestination(isPresented: $settingsOpen) {
                SettingsView()
            }
            .navigationBarBackButtonHidden()
        
    }
    
    private var mapView: some View {
        ZStack {
            Image("map")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            Button(action: {
                settingsOpen.toggle()
            }, label: {
                Image("settings")
            })
            .position(x: 355, y: 55)
            
            Button(action: {
                
            }, label: {
                Image("bell")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                    .padding(10)
                    .background(Color.white)
                    .foregroundColor(.black)
                    .clipShape(Circle())
            })
            .offset(x: 150)
            
            Button(action: {
                
            }, label: {
                Image("navigation")
            })
            .offset(x:150, y: 50)
            
            GeometryReader {geometry in
                DrawerView()
                    .padding(.top, Padding.medium)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 340)
            .background(Color.white)
            .clipShape(.rect(topLeadingRadius: 25, topTrailingRadius: 25))
            .offset(y: UIScreen.main.bounds.height * 0.32)
        }
    }
}

#Preview {
    NavigationStack {
        HomeView()
    }
}
