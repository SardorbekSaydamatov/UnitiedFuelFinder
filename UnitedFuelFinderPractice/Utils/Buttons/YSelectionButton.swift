//
//  YSelectionButton.swift
//  UnitedFuelFinderPractice
//
//  Created by Sardorbek Saydamatov on 23/12/23.
//

import SwiftUI


struct YSelectionButton<Content: View>: View {
    @State private var isPresented: Bool = false
    @State private var selectedState: String
    var content: (Binding<String>) -> Content

    init(selectedState: String, content: @escaping (Binding<String>) -> Content) {
        self._selectedState = State(initialValue: selectedState)
        self.content = content
    }

    var body: some View {
        ZStack {
            Button(action: {
                isPresented = true
            }, label: {
                HStack {
                    Text(selectedState)
                        .font(Font.custom("SF Compact", size: 13))
                        .foregroundStyle(Color.init(uiColor: .label))

                    Spacer()

                    Image(systemName: "chevron.right")
                        .frame(width: 24, height: 24)
                        .foregroundStyle(Color.init(uiColor: .label))
                }
            })
            .padding(.horizontal)
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            .background(RoundedRectangle(cornerRadius: 8)
            .stroke(lineWidth: 1).foregroundStyle(Color.gray.opacity(0.5)))
        }
        .sheet(isPresented: $isPresented, content: {
            content($selectedState)
        })
    }
}


//struct YSelectionButton<Content: View>: View {
//    @State var isPresented: Bool = false
//    @State var title: String
//    var content: () -> Content
//
//    var body: some View {
//        ZStack {
//            Button(action: {
//                isPresented = true
//            }, label: {
//                HStack {
//                    Text(title)
//                        .font(Font.custom("SF Compact", size: 13))
//                        .foregroundStyle(Color.init(uiColor: .label))
//
//                    Spacer()
//
//                    Image(systemName: "chevron.right")
//                        .frame(width: 24, height: 24)
//                        .foregroundStyle(Color.init(uiColor: .label))
//                }
//            })
//            .padding(.horizontal)
//            .frame(maxWidth: .infinity)
//            .frame(height: 40)
//            .background(RoundedRectangle(cornerRadius: 8)
//            .stroke(lineWidth: 1).foregroundStyle(Color.gray.opacity(0.5)))
//        }
//        .sheet(isPresented: $isPresented, content: {
//            content()
//        })
//    }
//}



//#Preview {
//    YSelectionButton(title:"States")
//}
