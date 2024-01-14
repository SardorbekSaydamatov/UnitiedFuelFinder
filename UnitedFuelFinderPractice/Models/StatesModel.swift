//
//  StatesModel.swift
//  UnitedFuelFinderPractice
//
//  Created by Sardorbek Saydamatov on 05/12/23.
//

import Foundation
import SwiftUI

struct StatesModel: Identifiable {
    let id = UUID()
    let state: String
    var isSelected: Bool = false
}
