//
//  YSearchField.swift
//  UnitedFuelFinderPractice
//
//  Created by Sardorbek Saydamatov on 19/12/23.
//

import SwiftUI

struct YSearchField: View {
    
    @Binding public var text: String
    public var imageName: String = "person.fill"
    public var placeholder: String
    public var lineLimit: Int = 3
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .foregroundStyle(Color.gray)
            TextField("", text: $text, prompt: Text(placeholder), axis: .vertical)
                .textContentType(.streetAddressLine1)
                .font(Font.system(size: 14, weight: .regular))
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
        .frame(height: 40)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(5)
        .padding()
    }
}

