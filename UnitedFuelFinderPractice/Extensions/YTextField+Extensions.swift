//
//  YTextField+Extensions.swift
//  UnitedFuelFinderPractice
//
//  Created by Sardorbek Saydamatov on 28/11/23.
//

import Foundation
import SwiftUI

public extension View {
    func placeholder(
        _ text: String,
        when shouldShow: Bool,
        alignment: Alignment = .leading, color: Color = Color("accent").opacity(0.47)) -> some View {
            
            placeholder(when: shouldShow, alignment: alignment) { Text(text).foregroundColor(color) }
        }
    
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
    
    func keyboardDismissable() -> some View {
        self.toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                HStack {
                    EmptyView()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Button(action: {dismissKeyboard()}, label: {
                        
                        Image(systemName: "keyboard.chevron.compact.down")
                            .foregroundStyle(Color.init(uiColor: .label))
                    })
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
        }
    }
    
     func dismissKeyboard() {
        guard let activeView = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first else {
            return
        }
        activeView.endEditing(true)
    }
}

