//
//  StatesViewModel.swift
//  UnitedFuelFinderPractice
//
//  Created by Sardorbek Saydamatov on 05/12/23.
//

import Foundation
import SwiftUI

class StatesViewModel: ObservableObject {
    var selectedState: StatesModel?
    @Published var states = [StatesModel(state: "Fergana", isSelected: false),
                  StatesModel(state: "Tashkent", isSelected: false),
                  StatesModel(state: "Bukhara", isSelected: false),
                  StatesModel(state: "Samarkand", isSelected: false),
                  StatesModel(state: "Andijan", isSelected: false),
                  StatesModel(state: "Kashkadarya", isSelected: false),
                  StatesModel(state: "Surkhandarya", isSelected: false),
                  StatesModel(state: "Xorazm", isSelected: false),
                  StatesModel(state: "Jizakh", isSelected: false),
                  StatesModel(state: "Navoi", isSelected: false),
                  StatesModel(state: "Sirdaryo", isSelected: false),
                  StatesModel(state: "Qoraqalpagistan", isSelected: false)]
    
    func updateState(item: StatesModel) {
        if let index = states.firstIndex(where: { $0.id == item.id }) {
            if let selectedIndex = states.firstIndex(where: { $0.isSelected }) {
                states[selectedIndex].isSelected = false
            }
            
            states[index].isSelected.toggle()
        }
        
    }
}
