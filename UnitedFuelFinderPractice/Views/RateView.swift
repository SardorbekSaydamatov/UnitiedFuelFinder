//
//  RateView.swift
//  UnitedFuelFinderPractice
//
//  Created by Sardorbek Saydamatov on 06/01/24.
//

import SwiftUI

public struct RateView: View {
    public var starsCount: Int = 5
    @Binding public var rate: Int
    public var canRate: Bool = true
    
    var onChangeRate: ((Int) -> Void)?
    
    public var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<starsCount, id: \.self) { i in
                Image(rate > i ? "icon_star_fill" : "icon_star_empty")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .onTapGesture {
                        if canRate {
                            rate = i + 1
                        onChangeRate?(rate)
                        }
                    }
            }
        }
    }
    
    func set(onRateChange: @escaping (Int) -> Void) -> Self {
        var v = self
        v.onChangeRate = onRateChange
        rate = 0
        return v
    }
}

//#Preview {
//    RateView()
//        .frame(height: 20)
//}
