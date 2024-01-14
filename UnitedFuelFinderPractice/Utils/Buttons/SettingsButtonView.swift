//
//  SettingsButtonView.swift
//  UnitedFuelFinderPractice
//
//  Created by Sardorbek Saydamatov on 05/01/24.
//

import SwiftUI

struct SettingsButtonView: View {
    @State var title: String
    @State var image1: String
    @State var color: Color = Color.black
    var onClick: () -> Void
        var body: some View {
        Button(action: {
            onClick()
        }, label: {
            HStack {
                Image(systemName: image1)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .foregroundStyle(color)
                    .padding(10)
                    .background(Color.gray.opacity(0.1))
                    .clipShape(Circle())
                
                Text(title)
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }
            .foregroundStyle(Color.black)
            .padding(.horizontal)
        })
    }
}
