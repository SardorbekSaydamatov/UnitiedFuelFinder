//
//  UnitedFuelFinderPracticeApp.swift
//  UnitedFuelFinderPractice
//
//  Created by Sardorbek Saydamatov on 26/11/23.
//

import SwiftUI

@main
struct UnitedFuelFinderPracticeApp: App {
    init(){
        DataInitializer.prepopulateStations()
    }
    var body: some Scene {
        WindowGroup {
            AuthView()
        }
    }
}
