//
//  CustomBackButton.swift
//  UnitedFuelFinderPractice
//
//  Created by Sardorbek Saydamatov on 25/12/23.
//

import SwiftUI

struct CustomBackButton: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: "chevron.left")
            }
            .foregroundColor(.orange)
        }
    }
}

//#Preview {
//    CustomBackButton()
//}
