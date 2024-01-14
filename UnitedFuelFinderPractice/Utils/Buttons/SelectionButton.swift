//
//  SelectionButton.swift
//  UnitedFuelFinderPractice
//
//  Created by Sardorbek Saydamatov on 01/12/23.
//

import SwiftUI

public struct SelectionButton: View {
    var title: String
    var value: String
    var onClick: () -> Void
    public init(title: String, value: String, onClick: @escaping () -> Void) {
        self.title = title
        self.value = value
        self.onClick = onClick
    }
    
    public var body: some View {
        Button(action: onClick) {
            innerBody
        }
    }
    
    public var innerBody: some View {
        HStack {
            Text(title)
                .font(.system(size: 14, weight: .regular))
            Spacer()
            Text(value)
                .font(.system(size: 13, weight: .medium))
                .padding(.trailing, 4)
                .foregroundStyle(Color.init(uiColor: .secondaryLabel))
            
            Image(systemName: "chevron.right")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 16)
        }
        .foregroundStyle(Color.init(uiColor: .label))
        .frame(height: 50)
        .padding(.horizontal, Padding.medium)
        .background(
            RoundedRectangle(
                cornerRadius: 8
            )
            .stroke(lineWidth: 1).foregroundStyle(Color.gray.opacity(0.5)
            )
        )
    }
}


#Preview {
    SelectionButton(title: "States", value: "Uzbekistan") {
        
    }
}
