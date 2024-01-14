//
//  CheckButton.swift
//  UnitedFuelFinderPractice
//
//  Created by Sardorbek Saydamatov on 28/11/23.
//

import Foundation
import SwiftUI

struct CheckButton: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }, label: {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
            }
        })
        .foregroundStyle(Color.init(uiColor: .label))
    }
}
