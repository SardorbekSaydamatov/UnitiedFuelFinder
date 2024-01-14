//
//  YTextFieldView.swift
//  UnitedFuelFinderPractice
//
//  Created by Sardorbek Saydamatov on 27/11/23.
//

import SwiftUI

public struct YTextFieldView: View {
    @Binding public var text: String
    public var placeholder: String
    public var lineLimit: Int = 3
    @FocusState private var isFocused: Bool
    
    public var body: some View {
        HStack {
            Image(systemName: "person.fill")
            TextField("", text: $text, prompt: Text(placeholder), axis: .vertical)
                .textContentType(.streetAddressLine1)
                .font(Font.system(size: 14, weight: .regular))
        }
        .padding(15)
        .background(
            RoundedRectangle(
                cornerRadius: 8
            )
            .stroke(lineWidth: 1).foregroundStyle(
                isFocused ? Color.black.opacity(0.8) : Color.gray.opacity(0.5)
            )
            .padding(.horizontal, 1)
        )
        
        .focused($isFocused)
    }
}

