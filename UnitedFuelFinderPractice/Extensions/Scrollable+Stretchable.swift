//
//  Scrollable+Stretchable.swift
//  UnitedFuelFinderPractice
//
//  Created by Sardorbek Saydamatov on 05/01/24.
//

import SwiftUI

public extension View {
   
    
    func scrollable(axis: Axis.Set = .vertical, showIndicators: Bool = false) -> some View {
        self.modifier(ScrollableModifier(axis: axis, indicators: showIndicators))
    }
    
    func horizontal(alignment: Alignment) -> some View {
        self
            .frame(maxWidth: .infinity, alignment: alignment)
    }
    
    func vertical(alignment: Alignment) -> some View {
        self
            .frame(maxHeight: .infinity, alignment: alignment)
    }
    
    func didAppear(action: @escaping () -> Void) -> some View {
        self.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                action()
            }
        }
    }
}

extension View {

    @ViewBuilder
    func stretchable(in geo: GeometryProxy) -> some View {
        let width = geo.size.width
        let height = geo.size.height
        let minY = geo.frame(in: .global).minY
        let useStandard = minY <= 0
        self.frame(width: width, height: height + (useStandard ? 0 : minY))
            .offset(y: useStandard ? 0 : -minY)
    }
}


