//
//  SelectComapnyView.swift
//  UnitedFuelFinderPractice
//
//  Created by Sardorbek Saydamatov on 25/12/23.
//

import SwiftUI

struct SelectCompanyView: View {
    @ObservedObject var viewModel = StatesViewModel()
    @Environment (\.dismiss) var dismiss
    @State private var searchText: String = ""
    @State private var isSearchActive: Bool = false
    @Binding var selectedState: String
    
    var title: String = "States"
    
    var filteredItems: [StatesModel] {
        if searchText.isEmpty {
            return viewModel.states
        } else {
            return viewModel.states.filter { $0.state.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment:.leading) {
                    YSearchField(text: $searchText, imageName: "magnifyingglass", placeholder: "Search")
                        .onTapGesture {
                            isSearchActive = true
                        }
                    ForEach(filteredItems) { item in
                        HStack {
                            Text(item.state)
                            Spacer()
                            if item.isSelected {
                                Image(systemName: "checkmark")
                                    .foregroundStyle(Color.orange)
                            }
                        }
                        .onTapGesture {
                            
                            viewModel.updateState(item: item)
                            selectedState = item.state
                        }
                        Divider()
                    }
                    .padding(.horizontal, Padding.large)
                }
            }
            .navigationTitle("States")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        if isSearchActive {
                            searchText = ""
                            isSearchActive = false
                        } else {
                            dismiss()
                        }
                    }) {
                        Text(isSearchActive ? "Cancel" : "Done")
                            .foregroundColor(Color.orange)
                    }
                }
            }
        }
    }
}

