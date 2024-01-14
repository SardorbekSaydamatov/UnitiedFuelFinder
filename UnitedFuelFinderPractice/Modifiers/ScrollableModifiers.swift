//
//  ScrollableModifiers.swift
//  UnitedFuelFinderPractice
//
//  Created by Sardorbek Saydamatov on 05/01/24.
//

import SwiftUI

struct ScrollableModifier: ViewModifier {
    var axis: Axis.Set
    var indicators: Bool
    
    func body(content: Content) -> some View {
        ScrollView(axis, showsIndicators: indicators) {
            content
        }
    }
}
